// ignore_for_file: file_names, unused_import, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:courso/layout/Home_loayout/Home_layout.dart';
import 'package:courso/modules/Notifications/DoneConfirm.dart';
import 'package:courso/modules/Notifications/notifications.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

class MassegNot extends StatelessWidget {
  const MassegNot(
      {super.key,
      required this.Date,
      required this.UserName,
      required this.CourseName, required this.Time});
  static String id = 'MassegNot';
  final String Date;
  final String UserName;
  final String CourseName;
  final String Time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Image(
                  width: 250,
                  height: 250,
                  image: AssetImage('assets/images/DoneRegister.png')),
            ],
          ),
           Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, top: 0, end: 20, bottom: 0),
            child: Text(
              'أهلاً بك ${UserName} في معهد رواد الحضارة ',
              style: const TextStyle(
                  color: Colors.black, fontFamily: 'cairo', fontSize: 20,fontWeight: FontWeight.w500),
            ),
          ),
           Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, top: 5, end: 20, bottom: 2),
            child: Text(
              'لقد تم قبولك في دورة ${CourseName} الواقعة في تاريخ ${Date} في تمام الساعة ${Time}',
              style: const TextStyle(
                  color: Colors.black, fontFamily: 'cairo', fontSize: 20),
            ),
          ),
           const Padding(
            padding:  EdgeInsetsDirectional.only(
                start: 20, top: 0, end: 20, bottom: 0),
            child: Text(
              'هل ترد تأكيد تسجيلك ؟',
              style:  TextStyle(
                  color: Colors.black, fontFamily: 'cairo', fontSize: 20),
            ),
          ),
              
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        defaultButton(
                          width: 150,
                          text: 'تأكيد التسجيل',
                          function: () async {
                                Navigator.of(context)
                                    .pushReplacementNamed(DoneConfirm.id);
                              } 
                        ),
                        defaultButton(
                          width: 150,
                          text: 'إلغاء التسجيل',
                          function: () async {
                                Navigator.of(context)
                                    .pushReplacementNamed(Home_Layout.id);
                              } 
                        ),
                      ],
                    ),
                  )
               
          
          
        ],
      ),
    );
  }
}
