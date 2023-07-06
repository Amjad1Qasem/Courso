// ignore_for_file: unnecessary_new, non_constant_identifier_names, prefer_const_constructors

import 'package:courso/controllers/coursController.dart';
import 'package:courso/models/class.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';



class Notifications extends StatelessWidget {
  const Notifications({super.key,});
  static String id = 'notificationId';
  // final int NotId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f7ff),
      appBar: AppBar(
        backgroundColor: const Color(0xFF71a7ee),
        elevation: 0.2,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: 
      FutureBuilder<List<Notificat>>(
        future: NotController.getNewNot(),
        builder: (context, snapshot) {
         if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final N = snapshot.data!;
          return
           Padding(
             padding: const EdgeInsets.all(20.0),
             child:
              SingleChildScrollView(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 //mainAxisAlignment: MainAxisAlignment.center,
                 children: N.map((notification) =>  GestureDetector(
                     onTap: (){
                       
                     },
                     child: 
                     ListTile(
                       textColor: Color(0xff333333),
                       leading: Image(image: NetworkImage(notification.courseImage)),
                       title: Text(notification.courseName),
                       subtitle: Text(notification.approved? " تمت الموافقة على طلب التسجيل":"  لم يتم الموافقة على طلب التسجيل  "),
                    
                    
                     ),
                   ),
                    ).toList()
                            ),
              ),
           );
        }
      ),
    );
  }
}
