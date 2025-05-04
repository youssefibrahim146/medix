
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medix/constants/extensions.dart';

import '../constants/strings.dart';
import '../model/services/auth_sercives.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  bool isExpanded = false;
  num totalTotalPrice = 0;
  bool isFavLoading = false;
  bool isCartLoading = false;
  UserModel? user;
  String selectedScreen = AppStrings.homeText;
  String selectedCategory = AppStrings.allText;
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments.length > 0) {
      user = Get.arguments[0];
    } else {
      user = null;
    }
    super.onInit();
  }
  signOut() {
    FirebaseAuthService().signOut().then(
          (value) {
        Get.offNamed(AppStrings.loginRoute);
      },
    ).catchError(
          (error) {
        error.toString().showToast;
      },
    );
  }
}