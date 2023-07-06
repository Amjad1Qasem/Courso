// ignore_for_file: file_names

import 'package:courso/Profile/EdirProfile.dart';
import 'package:courso/Profile/Setting.dart';
import 'package:courso/controllers/coursController.dart';
import 'package:courso/models/class.dart' as models;
import 'package:courso/models/class.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static String id = 'Profile';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f7ff),
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        title: const Text(
          'الصفحة الشخصية',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 208, 231, 255),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FutureBuilder<models.Profile>(
                          future:
                           ProfileController.getNewprofile(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            final p = snapshot.data!;
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // ignore: prefer_const_constructors
                                  // CircleAvatar(
                                  //   // backgroundImage: const AssetImage(
                                  //   //     'assets/images/userImagepng.png'),
                                  //   backgroundImage: NetworkImage(p.image),
                                  //   radius: 75,
                                  // ),
                                  // const SizedBox(
                                  //   height: 0,
                                  // ),
                                  defText(
                                      text: '${p.firstName}' ' ${p.lastName}',
                                      size: 25,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff2D527C)),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  defText(
                                      text: p.email,
                                      size: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff333333)),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  defText(
                                      text: p.phone,
                                      size: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff333333)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ]);
                          }),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfile()),
                                    );
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xff0163e2)
                                            .withOpacity(0.5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 3),
                                        child: Center(
                                            child: defText(
                                                text: 'تعديل الملف الشخصي',
                                                size: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ))),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      


                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Setting()),
                                    );
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xff0163e2)
                                            .withOpacity(0.5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 3),
                                        child: Center(
                                            child: defText(
                                                text: 'الاعدادات',
                                                size: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ))),
                            ),
                            const SizedBox(
                          height: 10,
                        ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color(0XFF0063e2),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        child: defText(
                            text: 'دوراتي :',
                            size: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ],
                ),
                FutureBuilder<List<Course>>(
                    future: MyCourseController.getNewMyCourses(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final courses = snapshot.data!;
                      return Column(
                          children: courses
                              .map((course) => Mycours(
                                    coursImage: NetworkImage(course.image),
                                    coursName: course.name,
                                    instutName: course.institute,
                                    isFree: course.isFree,
                                    courseId: course.id,
                                  ))
                              .toList()
                          // Mycours(
                          //     // coursImage:
                          //     //     const AssetImage('assets/images/C2.png'),
                          //     // coursName: ' قيادة الحاسب ICDL',
                          //     // instutName: ' معهد رواد الحضارة',
                          //     // typeCours: 'مستمرة  الآن'
                          //     ),

                          );
                    }),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Mycours({
  required int courseId,
  required ImageProvider coursImage,
  required String coursName,
  required String instutName,
  required bool isFree,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 10, bottom: 10),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurStyle: BlurStyle.normal,
              offset: Offset(-2, 2),
              color: Colors.black54,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // ignore: prefer_const_constructors
                    child: Image(
                      image: coursImage,
                      width: 150,
                      height: 120,
                      fit: BoxFit.cover,
                    ))
              ],
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coursName,
                      style: const TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      instutName,
                      style: const TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      isFree ? 'مجاني' : '',
                      style: const TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 0, 0)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
