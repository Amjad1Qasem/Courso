// ignore_for_file: file_names

import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  static String id = 'Setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xfff2f7ff),
       appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        title: const Text(
          'الاعدادات',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow:const  [
                 BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){},
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.notifications,size: 30,color: Colors.black54,),
                        const SizedBox(width: 15,),
                        defText(text: 'Notifications', size: 18, fontWeight: FontWeight.w500, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){},
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.question_mark_rounded,size: 30,color: Colors.black54,),
                       const  SizedBox(width: 15,),
                        defText(text: 'Help & Support', size: 18, fontWeight: FontWeight.w500, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){},
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.flag_outlined,size: 30,color: Colors.black54,),
                        const SizedBox(width: 15,),
                        defText(text: 'Report a problem', size: 18, fontWeight: FontWeight.w500, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                // GestureDetector(
                //   onTap: (){},
                //   // ignore: avoid_unnecessary_containers
                //   child: Container(
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         const Icon(Icons.logout_outlined,size: 30,color: Colors.black54,),
                //         const SizedBox(width: 15,),
                //         defText(text: 'Log out', size: 18, fontWeight: FontWeight.w500, color: Colors.black),
                //       ],
                //     ),
                //   ),
                // ),
                  
              ],
                  ),
            ),
          ),
        ),
    );
  }
}
