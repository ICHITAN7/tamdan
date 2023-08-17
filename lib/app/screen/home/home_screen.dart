import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamdan/app/Controller/main_controller.dart';
import 'package:tamdan/app/screen/login_register/login.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(MainController());
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        builder: (_){
          return Scaffold(
            body:controller.authenticated==true?controller.lstScreens[index]:login_screen(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey.withOpacity(0.8),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: 'Post'),
                BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Star'),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
              ],
              onTap: (Index){
                setState(() {
                  index = Index;
                });
              },
            ),
          );
        }
    );
  }
}
