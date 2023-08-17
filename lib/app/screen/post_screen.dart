import 'package:flutter/material.dart';
class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Profile User
                  Row(children: [
                    CircleAvatar(
                      child: Text('hi'),
                      backgroundColor: Colors.red,
                      radius: 35,
                    ),
                    Text( '   Name User',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ],),
                  const SizedBox(height:10,),
                  Text('     Title Post ',style: TextStyle(fontSize: 18),),
                  const SizedBox(height:10,),
                  Container(
                    height: 350,
                    color: Colors.red,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border,)),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon:Icon(Icons.comment_bank_outlined,)),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon:Icon(Icons.ios_share_outlined,)),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
