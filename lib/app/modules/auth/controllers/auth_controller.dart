import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sophie/app/data/models/sub_user_mode.dart';
import 'package:sophie/app/data/models/user_model.dart';
import 'package:sophie/app/modules/auth/mixins/cache_mixin.dart';
import 'package:sophie/app/routes/app_pages.dart';

class AuthController extends GetxController with CacheManager {
  static AuthController to = Get.find<AuthController>();
  final localStorage = GetStorage();

  RxBool isLoggedIn = false.obs;
  RxnString token = RxnString();
  Rxn<UserModel> user = Rxn<UserModel>();
  Rxn<SubUserModel> subUser = Rxn<SubUserModel>();

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });
    super.onInit();
  }

  _setInitialScreen(bool isLoggedIn) {
    Future.delayed(Duration(seconds: 2), () async {
      if (isLoggedIn) {
        Get.offAllNamed(Routes.SELECT_PROFILE);
      } else {
        final isFirstTime = await localStorage.read("isFirstTime");
        isFirstTime == true
            ? Get.offAllNamed(Routes.LOGIN_SOCIAL)
            : Get.offAllNamed(Routes.ONBOARDING);
        await localStorage.writeIfNull("isFirstTime", true);
      }
    });
  }

  _checkLoginStatus() async {
    Map<String, dynamic>? authData = await getCachedAuthData();
    print(authData);
    if (authData != null) {
      token.value = authData["token"];
      user.value = UserModel.fromJson(authData["user"]);
      isLoggedIn.value = true;
      _setInitialScreen(true);
    } else {
      isLoggedIn.value = false;
      _setInitialScreen(false);
    }
  }

  Future<void> logOut() async {
    isLoggedIn.value = false;
    token.value = null;
    user.value = null;
    subUser.value = null;
    _setInitialScreen(false);
    removeCachedAuthData();
  }

  Future<void> login(
      String token, Map<String, dynamic> user, bool shouldNavigate) async {
    this.token.value = token;
    final parsedUser = UserModel.fromJson(user);
    this.user.value = parsedUser;
    isLoggedIn.value = true;
    if (shouldNavigate) {
      _setInitialScreen(true);
    }
    // Token is cached
    await cacheAuthData(token, parsedUser);
  }

  Future<void> setUserDetail(Map<String, dynamic> user) async {
    final parsedUser = UserModel.fromJson(user);
    this.user.value = parsedUser;
    // Token is cached
    await cacheAuthData(this.token.value!, parsedUser);
  }

  void setSubUser(SubUserModel subUser) {
    this.subUser.value = subUser;
    Get.offAllNamed(Routes.BASE);
  }

  void unsetSubUser() {
    subUser.value = null;
    Get.offAllNamed(Routes.SELECT_PROFILE);
  }
}
