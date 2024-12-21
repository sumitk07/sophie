import 'package:get/get.dart';
import 'package:sophie/app/shared/dialog.dart';

class SubscriptionController extends GetxController {
  bool popupShown = false;

  void subscriptionPopup() {
    print(popupShown);
    popupShown = true;
    // if (!popupShown)
    dialog(
      title:
          "Click here to subscribe via our website to continue access the app",
      image: "assets/images/subscription/popup.png",
      primaryAction: Get.back,
      primaryTitle: "Go",
    );
  }
}
