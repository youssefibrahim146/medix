import 'package:get/get.dart';
import 'package:medix/constants/extensions.dart';

import '../model/services/auth_sercives.dart';
import '../model/user_model.dart';

class ProfileController extends GetxController {
  UserModel user = Get.arguments[0];

  logout()async {
    await FirebaseAuthService().signOut().then(
      (value) {
        if (value == null) {
          Get.offAllNamed("/login");
        } else {
          value.toString().showToast;
        }
      },
    );
    Get.offAllNamed("/login");
  }
}