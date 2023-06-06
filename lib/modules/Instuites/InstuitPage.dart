// ignore: unused_import
// ignore_for_file: unused_import, duplicate_ignore, non_constant_identifier_names, file_names

import 'dart:math';

import 'package:courso/modules/Cours%20Details/RegistrationForm.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

var courscontroller = TextEditingController();
// ignore: unnecessary_new
GlobalKey<ScaffoldState> ScaffoldKey = new GlobalKey<ScaffoldState>();

class InstuitPage extends StatefulWidget {
  const InstuitPage({super.key, required this.insttuitId});
  static String id = 'InstuitPage';
  final int insttuitId;

  @override
  State<InstuitPage> createState() => _InstuitPageState();
}

class _InstuitPageState extends State<InstuitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                              colors: [
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
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140, bottom: 10),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/ins1.png',
                        fit: BoxFit.cover,
                        width: 335,
                        height: 305,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20,
                end: 20,
                top: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  defText(
                      text: 'مركز الرواد للتربية والتعليم',
                      size: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000)),
                  defText(
                      text:
                          'دورات تقوية للشهادتين الاعدادية والثانوية - صيانة الحاسب-مهارات الحاسب-مستويات باللغة الانجليزية و الفرنسية .',
                      size: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54),
                      color: const Color(0xffe2f0fe),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Image(
                                    width: 50,
                                    height: 50,
                                    image: AssetImage(
                                        'assets/images/WebsiteInstuite.png')),
                                defText(
                                    text: 'www.alroad.sy',
                                    size: 18,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF333333)),
                              ],
                            ),
                          ),
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Image(
                                    width: 40,
                                    height: 40,
                                    image: AssetImage(
                                        'assets/images/PhoneInstuite.png')),
                                defText(
                                    text: '+963 11 311 3035 ',
                                    size: 18,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF333333)),
                              ],
                            ),
                          ),
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Image(
                                    width: 40,
                                    height: 40,
                                    image: AssetImage(
                                        'assets/images/FacebookInstuite.png')),
                                defText(
                                    text: 'معهد الرواد للتربية والتعليم',
                                    size: 18,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF333333)),
                              ],
                            ),
                          ),
                          Container(
                            height: 0.5,
                            width: double.infinity,
                            color: Colors.black54,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Image(
                                    width: 40,
                                    height: 40,
                                    image: AssetImage(
                                        'assets/images/LocationInstuite.png')),
                                defText(
                                    text: 'دمشق ,مشروع دمر ,(ج3)',
                                    size: 18,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF333333)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defText(
                          text: 'اطلب دورتك الأن :',
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: defaultTextFormField(
                          hintText: ' ',
                          sufixfun: () {
                            return null;
                          },
                          validator: MultiValidator([]),
                          radius: 10,
                          controller: courscontroller,
                          keyboard: TextInputType.name,
                          labText: ' ',
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: defaultButton(
                              width: 100,
                              function: () {
                                courscontroller.clear();
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
                                            const EdgeInsetsDirectional.only(
                                                start: 10),
                                        child: defText(
                                            text: 'تم ارسال الطلب بنجاح',
                                            size: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                          label: 'اغلاق', onPressed: () {})),
                                );
                                return null;
                              },
                              text: 'إرسال'))
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defText(
                            text: 'الدورات الحالية :',
                            size: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        TextButton(
                          child: defText(
                              text: 'عرض الكل',
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            // children: [
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C2.png'),
                            //     coursName: 'قيادة الحاسب ICDL',
                            //     instutName: '',
                            //     isFree: ' ',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C8.png'),
                            //     coursName: 'UI/UX desgin',
                            //     instutName: '',
                            //     isFree: 'free',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C9.png'),
                            //     coursName: 'التسويق الالكتروني',
                            //     instutName: '',
                            //     isFree: ' ',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C5.png'),
                            //     coursName: 'الفيزياء',
                            //     instutName: '',
                            //     isFree: 'free',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C10png.png'),
                            //     coursName: 'المحاسبة',
                            //     instutName: ' ',
                            //     isFree: ' ',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            // ],

                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defText(
                            text: 'الدورات الحالية :',
                            size: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        TextButton(
                          child: defText(
                              text: 'عرض الكل',
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            // children: [
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C7.png'),
                            //     coursName: 'English',
                            //     instutName: '',
                            //     isFree: ' ',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C6.png'),
                            //     coursName: 'إدارة الموارد البشرية',
                            //     instutName: '',
                            //     isFree: ' ',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            //   cours(
                            //     coursImage:
                            //         const AssetImage('assets/images/C3.png'),
                            //     coursName: 'دورة CCNA',
                            //     instutName: '',
                            //     isFree: ' ',
                            //   ),
                            //   const SizedBox(
                            //     width: 15,
                            //   ),
                            // ],

                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
