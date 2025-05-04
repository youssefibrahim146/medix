import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medix/constants/colors.dart';

import '../../controller/splashController.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Image.asset("assets/medix logo.png"),
        ),
      ),
    );
  }
}
