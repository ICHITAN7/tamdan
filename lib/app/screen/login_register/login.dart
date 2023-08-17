import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamdan/app/Controller/login_controller.dart';
import 'package:tamdan/app/Screen/Login_Register/register.dart';
class login_screen extends StatelessWidget {
  login_screen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<LoginController>(
            builder: (context){
              return Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Get.height*0.1),
                      const Text(
                        'Login',
                        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Get.height*0.05),
                      SizedBox(
                        width: Get.width*0.7,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value!.isEmpty || !value.isEmail) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              controller: emailCon,
                            ),
                            SizedBox(height: Get.height*0.02),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              controller: passwordCon,
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
                                        'Login',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      onPressed: () {
                                        if (_formkey.currentState!.validate()) {
                                          _formkey.currentState!.save();
                                          String email = emailCon.text;
                                          String password = passwordCon.text;
                                          controller.login(email: email, password: password);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height*0.01),
                            Row(
                              children:const [
                                Expanded(
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                ),
                                Text(' OR '),
                                Expanded(
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 35,
                                    width: 300,
                                    child: TextButton(
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      onPressed: () {
                                        Get.to(()=>register_screen());
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
