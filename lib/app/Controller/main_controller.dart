import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamdan/app/Controller/login_controller.dart';
import 'package:tamdan/app/Controller/profile_controller.dart';
import 'package:tamdan/app/screen/post_screen.dart';
import 'package:tamdan/app/screen/profile_screen.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  bool authenticated = false;
  final login = Get.put(LoginController());
  final profile = Get.put(ProfileController());
  @override
  void onInit() {
    super.onInit();
    isAuthenticated();
  }
  List<Widget> lstScreens = [PostScreen(),PostScreen(),ProfileScreen()];
  void isAuthenticated() {
    final token = login.box.read("access_token");
    if (token != null) {
      authenticated = true;
    }
  }
  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}