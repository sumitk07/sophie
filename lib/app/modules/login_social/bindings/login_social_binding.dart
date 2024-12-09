import 'package:get/get.dart';

import '../controllers/login_social_controller.dart';

class LoginSocialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginSocialController>(
      () => LoginSocialController(),
    );
  }
}
