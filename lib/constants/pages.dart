
import 'package:get/get.dart';
import 'package:medix/constants/extensions.dart';
import 'package:medix/constants/strings.dart';
import 'package:medix/view/screens/about_disease_screen.dart';
import 'package:medix/view/screens/chat_screen.dart';
import 'package:medix/view/screens/drug_screen.dart';
import 'package:medix/view/screens/ulternative_drug_screen.dart';

import '../view/screens/home_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/screens/signup_screen.dart';
import '../view/screens/splash_screen.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppStrings.splashRoute, page: () => const SplashScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.loginRoute, page: () => const LoginScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.signupRoute, page: () => const SignUpScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.homeRoute, page: () => const HomeScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.drugInfoRoute, page: () => const DrugScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.abouteDiseaseRoute, page: () => const AboutDiseaseScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.chatRoute, page: () => const ChatScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.ulternativeRoute, page: () => const UlternativeDrugScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),


    //GetPage(name: "/route", page: () => const CheckOutScreen(), transition: Transition.noTransition),
    //GetPage(name: AppStrings.profileRoute, page: () => const ProfileScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),

  ];
}