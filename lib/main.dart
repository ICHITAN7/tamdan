import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tamdan/app/screen/login_register/login.dart';

import 'app/Screen/Login_Register/register.dart';
import 'app/screen/home/home_screen.dart';
void main() async {
  await GetStorage.init();
  runApp(const MainScreen());
}
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "home",
      // initialBinding: LoginBinding(),
      getPages: [
        GetPage(name: "/login", page: () => login_screen()),
        GetPage(name: "/register", page: () => register_screen()),
        GetPage(name: "/home", page: () =>const HomeScreen()),
      ],
    );
  }
}


