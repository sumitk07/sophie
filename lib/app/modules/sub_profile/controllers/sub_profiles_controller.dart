import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sophie/app/data/api/auth_api.dart';
import 'package:sophie/app/data/models/sub_user_mode.dart';
import 'package:sophie/app/modules/select_profile/controllers/select_profile_controller.dart';
import 'package:sophie/app/shared/theme.dart';
import 'package:sophie/app/widgets/custom_button.dart';

class SubProfilesController extends GetxController {
  final _authApi = AuthApi();
  final _selectProfileController = SelectProfileController.to;

  RxBool loading = false.obs;
  RxList<SubUserModel> subUsers = RxList<SubUserModel>();

  final ImagePicker _picker = ImagePicker();
  Rxn<XFile> profileImage = Rxn(null);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  void onInit() {
    dobController.text = Jiffy.now().format(pattern: 'MMM dd, yyyy');
    fetchSubUsers();
    super.onInit();
  }

  Future<void> fetchSubUsers() async {
    loading.value = true;
    subUsers.value = await _authApi.getSubUsers();
    loading.value = false;
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

  Future<void> addSubprofile() async {
    String fullName = fullNameController.text;
    String dob = dobController.text;
    String gender = genderController.text;

    loading(true);
    try {
      final response = await _authApi.createSubUser(
        fullName,
        dob,
        gender,
        profileImage.value,
      );

      if (response.statusCode == 200) {
        await _selectProfileController.fetchSubUsers();
        Get.back();
      }
    } catch (err) {
      log(err.toString());
    } finally {
      loading(false);
    }
  }
}
