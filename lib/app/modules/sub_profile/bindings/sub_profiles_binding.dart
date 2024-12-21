import 'package:get/get.dart';

import '../controllers/sub_profiles_controller.dart';

class SubProfilesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubProfilesController>(
      () => SubProfilesController(),
    );
  }
}
