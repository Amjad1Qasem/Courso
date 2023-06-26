// ignore_for_file: file_names, unused_import

import 'package:courso/layout/Home_loayout/Home_layout.dart';
import 'package:courso/modules/Notifications/notifications.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';
class DoneConfirm extends StatelessWidget {
  const DoneConfirm({super.key});
  static String id = 'DoneConfirm';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Image(
              width: 250,
              height: 250,
              image: AssetImage('assets/images/DoneConfirm1.png')),
              const  SizedBox(height: 10,),
            defText(
                text: 'تم اتمام عملية التسجيل ',
                size: 30,
                fontWeight: FontWeight.w500,
                color: const Color(0xff000000)),
            GestureDetector(
                onTap: () {
                // ignore: avoid_print
                print('object');
              },
              child: defaultButton(
                  width: 255,
                  text: 'العودة للصفحة الرئيسية',
                  // ignore: body_might_complete_normally_nullable
                  function: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Home_Layout.id);
                  }),
            ),
          ],
        ),
      ),
    );

  }
}