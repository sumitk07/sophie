import 'package:get/get.dart';
import 'package:sophie/app/modules/home/controllers/home_controller.dart';
import 'package:sophie/app/modules/profile/controllers/profile_controller.dart';
import 'package:sophie/app/modules/schedule/controllers/schedule_controller.dart';
import 'package:sophie/app/modules/sub_profile/controllers/sub_profiles_controller.dart';

import '../controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
      () => BaseController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(),
    );
    Get.lazyPut<SubProfilesController>(
      () => SubProfilesController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
