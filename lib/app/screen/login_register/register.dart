import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamdan/app/Controller/register_controller.dart';
class register_screen extends StatefulWidget {
  register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  final controller = Get.put(RegisterController());
  final _key = GlobalKey<FormState>();
  final nameCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GetBuilder<RegisterController>(
          builder: (context){
            return Center(
              child: Form(
                key:_key,
                child: Column(
                  children: [
                    SizedBox(height: Get.height*0.1),
                    Container(
                      padding: EdgeInsets.all(0),
                      width: Get.width*0.3,
                      height: Get.height*0.25,
                      child: GestureDetector(
                        onTap: ()=>controller.pickImage(),
                        child: CircleAvatar(
                          radius: 60,
                          child: Obx(() {
                            if (controller.selectedImage != null) {
                              return CircleAvatar(
                                radius: 65,
                                backgroundImage: FileImage(controller.selectedImage!),
                              );
                            } else {
                              return const Icon(Icons.add_a_photo_outlined);
                            }
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width*0.7,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameCon,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.isAlphabetOnly) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height*0.02),
                          TextFormField(
                            controller: emailCon,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid email';
                              }
                              if (!value.isEmail) {
                                return 'This is not type of a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height*0.02),
                          TextFormField(
                            controller: passwordCon,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            onSaved: (value) {
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height*0.02),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        _key.currentState!.save();
                                        String name = nameCon.text;
                                        String email = emailCon.text;
                                        String password = passwordCon.text;
                                        controller.register(
                                          name: name,
                                          email: email,
                                          password: password,
                                          profile:controller.selectedImage,
                                        );
                                      }
                                    },
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
            );
          },
        ),
      ),
    );
  }
}
