import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medix/constants/extensions.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
        title: Text(
          'Hello ${controller.user!.name}',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                33.gap,
                Padding(
                  padding: 10.edgeInsetsHorizontal,
                  child: Text(
                    "Medical Card",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                12.gap,
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(13, 42, 113, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightBlack.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.person, color: AppColors.white),
                          ),
                          Text(
                            "${controller.user!.name}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "*************************",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                      5.gap,
                    ],
                  ),
                ),
                20.gap,
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.blue, width: 1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Services",
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      10.gap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                               Get.toNamed(AppStrings.drugInfoRoute);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.medical_services, color: AppColors.white),
                                  Text(
                                    "Drug Info",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppStrings.abouteDiseaseRoute);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.report_problem_outlined, color: AppColors.white),
                                  Text(
                                    "About Disease",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          25.gap,
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppStrings.ulternativeRoute);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.update_disabled, color: AppColors.white),
                                  Text(
                                    "Ulternative drug",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppStrings.chatRoute);
        },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
