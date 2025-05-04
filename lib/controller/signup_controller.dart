
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medix/constants/extensions.dart';

import '../constants/strings.dart';
import '../model/services/auth_sercives.dart';
import '../model/services/firebase_services.dart';
import '../model/user_model.dart';

class SignUpController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isSignUpClicked = false;
  String name = AppStrings.emptySign;
  String email = AppStrings.emptySign;
  bool isCitizen = true;
  String nationalId = AppStrings.emptySign;
  String password = AppStrings.emptySign;
  GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    password = AppStrings.emptySign;
    name = AppStrings.emptySign;
    email = AppStrings.emptySign;
    isCitizen = true;
    nationalId = AppStrings.emptySign;

    update();
  }

  toggleIsCitizen() {
    isCitizen = true;
    update();
  }
  toggleIsVisitor() {
    isCitizen = false;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isSignUpClicked) {
      signUpFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To sign up.
  Future<void> signUp() async {
    isLoading = true;
    isSignUpClicked = true;
    checkFields();
    if (signUpFormStateKey.currentState!.validate()) {
      signUpFormStateKey.currentState!.save();
      dynamic signUpResponse = await FirebaseAuthService().signUp(email, password);
      if (signUpResponse is User) {
        FirebaseAuthService().signOut();
        UserModel user = UserModel(
          name: name,
          email: email,
          isCitizen: isCitizen,
          nationalId: nationalId,
        );
        dynamic uploadUserResponse = await FirebaseServices.uploadUser(user);
        if (uploadUserResponse is UserModel) {
          Get.offNamed(AppStrings.loginRoute);
        } else {
          uploadUserResponse.toString().showToast;
        }
      } else {
        signUpResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }
}