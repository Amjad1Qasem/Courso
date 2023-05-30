// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_import, avoid_print

import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../models/class.dart';

class Instuites extends StatelessWidget {
  Instuites({super.key});
  static String id = 'Instuites';

  List<InstuitModel> instuitList = [
    InstuitModel(
      instImage: AssetImage('assets/images/ins1.png'),
      instName: 'معهد الرواد',
      aboutInst:
          'دورات تأهيل الطلبة في التعليم الثانوي والاعدادي بجميع المناهج الدراسية',
    ),
    InstuitModel(
      instImage: AssetImage('assets/images/ins2.png'),
      instName: 'Harvard',
      aboutInst:
          'Harvard University is a private Ivy League research university in Cambridge, Massachusetts',
    ),
    InstuitModel(
      instImage: AssetImage('assets/images/ins3.png'),
      instName: 'مركزاكسبرت للتدريب والتأهيل',
      aboutInst: "تدريب وتاهيل مركز ",
    ),
    InstuitModel(
      instImage: AssetImage('assets/images/ins4.png'),
      instName: 'New Horizons',
      aboutInst: 'With over 300 centers in 70 countries,We are th best in',
    ),
    InstuitModel(
      instImage: AssetImage('assets/images/ins5.png'),
      instName: 'معهد تمكين للتدريب المجتمعي .',
      aboutInst: 'معهد تمكين لتمكين المرأة اقتصاديا ومهنيا',
    ),
    InstuitModel(
      instImage: AssetImage('assets/images/ins6.png'),
      instName: 'ICRCمنظمة الصليب الأحمر ',
      aboutInst: 'تسعى هذه المنظمة إلى الحفاظ على قدر من',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        title: const Text(
          'Institutes',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 10 / 16,
            crossAxisCount: 3,
          ),
          itemCount: instuitList.length,
          itemBuilder: (context, index) => buildInstuit(instuitList[index])),
    );
  }
}

// Build Item for list
Widget buildInstuit(InstuitModel inst) => Center(
      child: GestureDetector(
        onTap: () {
          print('inst');
        },
        child: Container(
          height: 225,
          width: 155,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 0)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          image: inst.instImage,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 125,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      inst.instName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      inst.aboutInst,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
