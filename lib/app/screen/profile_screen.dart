import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamdan/app/Controller/post_controller.dart';
import 'package:tamdan/app/Controller/profile_controller.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());
  final post = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body:GetBuilder<ProfileController>(
        builder: (context){
          return SingleChildScrollView(
                child:Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    width: double.infinity,
                    height: Get.height*1.5,
                    decoration:const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 85),
                          child: Container(
                            width: double.infinity,
                            height: Get.height,
                            decoration:const BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              width: 150,
                              height: 150,
                              padding:const EdgeInsets.only(top: 10),
                              child: CircleAvatar(
                                foregroundColor: Colors.blue,
                                ///foregroundImage: NetworkImage("http://127.0.0.1:8000/${controller.userData.data!.profileImage}"),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 170),
                          child: Column(
                            children: [
                              Row(children: [const Spacer(),controller.userData.data!.name!=null?Text('${controller.userData.data!.name}',style:const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),):const Text('Name'),const Spacer()],),
                              const SizedBox(height: 10,),
                              Row(children: [const Spacer(),controller.userData.data!.email!=null?Text('${controller.userData.data!.email}'):const Text('Email'),const Spacer()],),
                              MaterialButton(
                                child:const Text('refresh'),
                                  onPressed: (){
                                    print('Name : ${controller.userData.data!.name}');
                                    //print(controller.box.read('access_token'));
                                    print(post.post.message);
                                  }
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
          );
        },
      ),
    );
  }
}
