import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sophie/app/data/api/auth_api.dart';
import 'package:sophie/app/modules/auth/controllers/auth_controller.dart';
import 'package:sophie/app/routes/app_pages.dart';
import 'package:sophie/app/widgets/custom_button.dart';
import 'package:sophie/app/shared/theme.dart';
import 'package:dio/dio.dart' as dio;

class AddProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  final _authApi = AuthApi();
  final authController = AuthController.to;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool loading = false.obs;

  Rxn<XFile> profileImage = Rxn(null);

  @override
  void onInit() {
    dobController.text = Jiffy.now().format(pattern: 'MMM dd, yyyy');
    if (Get.arguments != null) {
      fullNameController.text = Get.arguments["fullName"];
      emailController.text = Get.arguments["email"];
    }
    super.onInit();
  }

  Future<void> imagePickerSourceDialog() async {
    PermissionStatus status;

    // Device Info for android 12
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;

    if (androidDeviceInfo.version.sdkInt <= 32) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.mediaLibrary.request();
    }

    if (status == PermissionStatus.granted) {
      Get.defaultDialog(
          title: "Source",
          titleStyle: medium.copyWith(fontSize: 24),
          middleText: "Select an image source",
          middleTextStyle: medium.copyWith(fontSize: 14),
          backgroundColor: secondary,
          radius: 16,
          contentPadding: const EdgeInsets.all(16),
          actions: [
            CustomButton(
              title: "Camera",
              onPressed: () => pickProfileImage(source: 'camera'),
              type: ButtonType.secondary,
            ),
            CustomButton(
              title: "Gallery",
              onPressed: () => pickProfileImage(source: 'gallery'),
            ),
          ]);
    }

    if (status == PermissionStatus.denied) {
      log("Permission not granted");
      await openAppSettings();
    }

    if (status == PermissionStatus.permanentlyDenied) {
      log("Permission not granted permanently");
      await openAppSettings();
    }
  }

  Future<void> pickProfileImage({source = 'gallery'}) async {
    try {
      if (source == 'gallery') {
        profileImage.value =
            await _picker.pickImage(source: ImageSource.gallery);
      } else if (source == 'camera') {
        profileImage.value =
            await _picker.pickImage(source: ImageSource.camera);
      }
    } catch (e) {
      log("error $e");
    }
    Get.back();
  }

  void selectDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          Jiffy.parse(dobController.text, pattern: "MMM dd, yyyy").dateTime,
      firstDate: DateTime(1970, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dobController.text =
          Jiffy.parseFromDateTime(picked).format(pattern: 'MMM dd, yyyy');
    }
  }

  Future<void> updateProfile() async {
    String fullName = fullNameController.text;
    String email = emailController.text;
    String phone = phoneNoController.text;

    String dob = '';
    if (dobController.text.isNotEmpty) {
      dob = Jiffy.parse(dobController.text, pattern: "MMM dd, yyyy")
          .dateTime
          .toIso8601String();
    }

    loading(true);
    try {
      final data = {
        "fullName": fullName,
        "dateOfBirth": dob,
      };

      if (Get.arguments != null && Get.arguments["email"] != null) {
        data["phoneNumber"] = phone;
        data["countryCode"] = "+91";
      }
      if (Get.arguments != null && Get.arguments["phone"] != null) {
        data["email"] = email;
      }

      final formData = dio.FormData.fromMap(data);
      if (profileImage.value != null) {
        formData.files.add(
          MapEntry(
            "registrationPlatePhoto",
            dio.MultipartFile.fromFileSync(profileImage.value!.path,
                filename: profileImage.value!.name),
          ),
        );
      }

      final response = await _authApi.updateUser(formData);

      if (response.statusCode == 200) {
        authController.setUserDetail(response.data["data"]["userDetail"]);
        Get.offAllNamed(Routes.SELECT_PROFILE);
      }
    } catch (err) {
      log(err.toString());
    } finally {
      loading(false);
    }
  }
}
