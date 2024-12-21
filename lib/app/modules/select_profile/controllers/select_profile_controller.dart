import 'package:get/get.dart';
import 'package:sophie/app/data/api/auth_api.dart';
import 'package:sophie/app/data/models/sub_user_mode.dart';

class SelectProfileController extends GetxController {
  static SelectProfileController to = Get.find<SelectProfileController>();

  final _authApi = AuthApi();

  RxBool loading = false.obs;
  RxList<SubUserModel> subUsers = RxList<SubUserModel>();

  @override
  void onInit() {
    fetchSubUsers();
    super.onInit();
  }

  Future<void> fetchSubUsers() async {
    loading.value = true;
    subUsers.value = await _authApi.getSubUsers();
    loading.value = false;
  }
}
