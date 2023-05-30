// ignore_for_file: unused_import, avoid_print, file_names

import 'package:courso/Profile/Setting.dart';
import 'package:courso/Profile/profilePage.dart';
import 'package:courso/modules/Home/home.dart';
import 'package:courso/modules/LoginPages/Login/Login.dart';
import 'package:courso/modules/LoginPages/Register/Register.dart';
import 'package:courso/modules/Notifications/notifications.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';
// import 'package:hidden_menu/drawer_screen.dart';

// ignore: camel_case_types
class drawerScreen extends StatefulWidget {
  const drawerScreen({super.key});
  static String id = 'drawerScreen';

  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

// ignore: camel_case_types
class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return
        // Scaffold(
        //   body:
        Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(colors: [
                Color(0xff73a7ee),
                Color(0xff72a7ee),
                Color(0xff75a9ef),
                Color(0xff8eb6f7),
                Color(0xff9fc0fa),
                Color(0xffa6c5fb),
                Color(0xffc3d7fe),
                Color(0xffe6eeff),
                Color(0xffeaf1ff),
                Color(0xfff1f6ff)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 100, top: 180),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(end: 20),
                        child: Text(
                          'أهلاً وسهلاً',
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Notifications.id);
                          },
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: const Text(
                              'الإشعارات',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.notifications,
                        size: 32,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Profile.id);
                          },
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: const Text(
                              'دوراتي',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.add_box,
                        size: 32,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Setting.id);
                          },
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: const Text(
                              'الإعدادات',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.settings,
                        size: 32,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(end: 30, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Login.id);
                          },
                          // ignore: avoid_unnecessary_containers
                          child: Container(
                            child: const Text(
                              'تسجبل الخروج',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.login_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      // )
      // ,

      // backgroundColor: const Color(0xff71a7ee).withOpacity(0.5),
      // body:
      // Padding(
      //   padding: const EdgeInsetsDirectional.only(start: 100, top: 180),
      //   child: Column(
      //     children: [
      //       Row(
      //         children: const [
      //           Expanded(
      //             child: Padding(
      //               padding: EdgeInsetsDirectional.only(end: 20),
      //               child: Text(
      //                 'أهلاً وسهلاً',
      //                 style: TextStyle(
      //                     fontSize: 35,
      //                     fontFamily: 'cairo',
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.white),
      //                 textAlign: TextAlign.end,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Padding(
      //         padding: const EdgeInsetsDirectional.only(end: 30),
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.of(context)
      //                       .pushReplacementNamed(Notifications.id);
      //                 },
      //                 // ignore: avoid_unnecessary_containers
      //                 child: Container(
      //                   child: const Text(
      //                     'الإشعارات',
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         fontFamily: 'cairo',
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white),
      //                     textAlign: TextAlign.end,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               width: 15,
      //             ),
      //             const Icon(
      //               Icons.notifications,
      //               size: 32,
      //               color: Colors.white,
      //             )
      //           ],
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 15,
      //       ),
      //       Padding(
      //         padding: const EdgeInsetsDirectional.only(end: 30),
      //         child: Row(
      //           children:  [
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: (){
      //                    Navigator.of(context)
      //                       .pushReplacementNamed(Profile.id);
      //                 },
      //                 // ignore: avoid_unnecessary_containers
      //                 child: Container(
      //                   child: const Text(
      //                     'دوراتي',
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         fontFamily: 'cairo',
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white),
      //                     textAlign: TextAlign.end,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               width: 15,
      //             ),
      //             Icon(
      //               Icons.add_box,
      //               size: 32,
      //               color: Colors.white,
      //             )
      //           ],
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 15,
      //       ),
      //       Padding(
      //         padding: const EdgeInsetsDirectional.only(end: 30),
      //         child: Row(
      //           children:  [
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: (){
      //                    Navigator.of(context)
      //                       .pushReplacementNamed(Setting.id);
      //                 },
      //                 // ignore: avoid_unnecessary_containers
      //                 child: Container(
      //                   child: const Text(
      //                     'الإعدادات',
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         fontFamily: 'cairo',
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white),
      //                     textAlign: TextAlign.end,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               width: 15,
      //             ),
      //             Icon(
      //               Icons.settings,
      //               size: 32,
      //               color: Colors.white,
      //             )
      //           ],
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 15,
      //       ),
      //       Padding(
      //         padding: const EdgeInsetsDirectional.only(end: 30, bottom: 10),
      //         child: Row(
      //           children:  [
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: (){
      //                    Navigator.of(context)
      //                       .pushReplacementNamed(Login.id);
      //                 },
      //                 // ignore: avoid_unnecessary_containers
      //                 child: Container(
      //                   child: const Text(
      //                     'تسجبل الخروج',
      //                     style: TextStyle(
      //                         fontSize: 22,
      //                         fontFamily: 'cairo',
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white),
      //                     textAlign: TextAlign.end,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(
      //               width: 15,
      //             ),
      //             Icon(
      //               Icons.login_outlined,
      //               size: 32,
      //               color: Colors.white,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
