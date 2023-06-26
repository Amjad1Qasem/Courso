// ignore_for_file: unnecessary_new, non_constant_identifier_names, prefer_const_constructors

import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> ScaffoldKey = new GlobalKey<ScaffoldState>();

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  static String id = 'Notifications';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){

                },
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/C1.png'),
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                      const Expanded(
                      child: Text(
                        'قام معهد الحضارة بارسال اشعار ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'cairo'),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, size: 25),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor:
                                  const Color.fromARGB(255, 23, 29, 36)
                                      .withOpacity(0.9),
                              margin: const EdgeInsetsDirectional.only(
                                  start: 6, end: 6, bottom: 6),
                              content: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 10),
                                child: defText(
                                    text: 'هل تريد حذف هذا الاشعار ؟',
                                    size: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              duration: const Duration(minutes: 1),
                              action: SnackBarAction(
                                  label: 'تأكيد', onPressed: () {
                                    
                                  })),
                        );
                      },
                    )
                  ],
                ),
              ),

              // defText(
              //     text: 'لا يوجد اي اشعارات جديدة',
              //     size: 20,
              //     fontWeight: FontWeight.w500,
              //     color: Colors.black.withOpacity(0.5))
            ],
          ),
        ),
      ),
    );
  }
}
