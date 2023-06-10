// ignore_for_file: unused_import, file_names
import 'package:courso/modules/Cours%20Details/CoursDetails.dart';
import 'package:courso/modules/Cours%20Details/RegistrationForm.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';
class Done extends StatelessWidget {
  const Done({super.key});
  static String id = 'Done';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Image(
              width: 250,
              height: 250,
              image: AssetImage('assets/images/Doneregistr.png')),
              const  SizedBox(height: 10,),
            defText(
                text: 'تم إتمام عملية التسجيل ',
                size: 30,
                fontWeight: FontWeight.w500,
                color: const Color(0xff000000)),
            defText(
                text: 'شكراً على تسجيلك',
                size: 30,
                fontWeight: FontWeight.w500,
                color: const Color(0xff000000)),
                const  SizedBox(height: 30,),
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
                        .pushReplacementNamed(Details.id);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
