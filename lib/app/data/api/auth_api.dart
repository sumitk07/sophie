import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sophie/app/config/api_config.dart';
import 'package:sophie/app/data/models/sub_user_mode.dart';
import 'package:sophie/app/shared/snackbar.dart';
import '../services/api_service.dart';

class AuthApi {
  final ApiService _apiService = ApiService();

  Future<Response> loginViaEmail(String email, String password) async {
    try {
      final data = {"email": email, "password": password};
      final Response response =
          await _apiService.post('${AppUrl.auth}/login', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loginViaPhone(String phone, String password) async {
    try {
      final data = {"phone": phone, "password": password};
      final Response response =
          await _apiService.post('${AppUrl.auth}/login', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> sendRegisterOtpPhone(
      String phoneNumber, String countryCode) async {
    try {
      final data = {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "type": "sms"
      };
      final Response response =
          await _apiService.post('${AppUrl.auth}/send-otp', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> sendRegisterOtpEmail(String email) async {
    try {
      final data = {"email": email, "type": "email"};
      final Response response =
          await _apiService.post('${AppUrl.auth}/send-otp', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> verifyRegisterOtpPhone(
    String phoneNumber,
    String countryCode,
    String otp,
  ) async {
    try {
      final data = {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "otp": otp,
        "type": 'sms'
      };
      final Response response = await _apiService.post(
        '${AppUrl.auth}/verify-otp',
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> verifyRegisterOtpEmail(String email, String otp) async {
    try {
      final data = {"email": email, "otp": otp, "type": 'email'};
      final Response response =
          await _apiService.post('${AppUrl.auth}/verify-otp', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> registerViaPhoneVerify(
    String phoneNumber,
    String countryCode,
    String fullName,
  ) async {
    try {
      final data = {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "fullName": fullName,
      };
      final Response response =
          await _apiService.post('${AppUrl.auth}/register', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> registerViaPhone(String phoneNumber, String countryCode,
      String fullName, String password) async {
    try {
      final data = {
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "fullName": fullName,
        "password": password
      };
      final Response response =
          await _apiService.post('${AppUrl.auth}/register', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> registerViaEmailVerify(
    String email,
    String fullName,
  ) async {
    try {
      final data = {"email": email, "fullName": fullName};
      final Response response =
          await _apiService.post('${AppUrl.auth}/register', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> registerViaEmail(
      String email, String fullName, String password) async {
    try {
      final data = {"email": email, "fullName": fullName, "password": password};
      final Response response =
          await _apiService.post('${AppUrl.auth}/register', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUserPassword(
    String password,
    String confirmPassword,
  ) async {
    try {
      final data = {
        "password": password,
        "confirmPassword": confirmPassword,
      };

      final formData = FormData.fromMap(data);

      final Response response = await _apiService.put(
        '${AppUrl.auth}/user',
        data: formData,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUser(FormData data) async {
    try {
      final Response response =
          await _apiService.put('${AppUrl.auth}/user', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Sub User ---------------------------------------
  Future<List<SubUserModel>> getSubUsers() async {
    try {
      final Response response =
          await _apiService.get('/${AppUrl.auth}/list-sub-users');

      if (response.statusCode == 200) {
        return List.from(response.data["data"])
            .map((e) => SubUserModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        if (e.response!.statusCode == 404) {
          CustomSnackbar.error("User not found");
        }
      } else {
        CustomSnackbar.error("Some error occured!");
        log(e.toString());
      }
    }
    return [];
  }

  Future<Response> createSubUser(String fullName, String dateOfBirth,
      String gender, XFile? profileImage) async {
    try {
      final data = {
        "fullName": fullName,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
      };

      final formData = FormData.fromMap(data);
      if (profileImage != null) {
        formData.files.add(
          MapEntry(
            "profileImage",
            MultipartFile.fromFileSync(profileImage.path,
                filename: profileImage.name),
          ),
        );
      }
      final Response response =
          await _apiService.post('${AppUrl.auth}/add-sub-user', data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
