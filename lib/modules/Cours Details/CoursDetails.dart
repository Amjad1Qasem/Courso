// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore

// ignore: unused_import
import 'dart:ffi';

import 'package:courso/controllers/coursController.dart';
import 'package:courso/models/class.dart';
import 'package:courso/modules/Cours%20Details/DoneRegistr.dart';
import 'package:courso/modules/Cours%20Details/RegistrationForm.dart';
// ignore: unused_import
import 'package:courso/modules/Instuites/InstuitPage.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.CoursId});
  static String id = 'Details';

  final int CoursId;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f7ff),
      body: FutureBuilder<CourseDetails>(
          future: CoursDetailsController.getNewDetails(widget.CoursId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // ignore: prefer_const_constructors
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final Coursdetail = snapshot.data!;

            
            return SingleChildScrollView(
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
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                  width: 320,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    Coursdetail.image,
                                  ))),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 0.5, color: Colors.black54),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    Coursdetail.instituteImage,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            defText(
                                text: Coursdetail.instituteName,
                                size: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defText(
                            text: Coursdetail.name,
                            size: 15,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff333333)),
                        defText(
                            text: Coursdetail.description,
                            size: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff333333)),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/MoneyIcon.png'),
                                  width: 45,
                                  height: 45,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                defText(
                                    text: ' التكلفة : ',
                                    size: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 50, top: 5),
                              child: Row(
                                children: [
                                  // Check if regular price is zero and sale price is null
                                  if (Coursdetail.regularPrice == 0 &&
                                      Coursdetail.salePrice == null)
                                    defText(
                                      text: 'مجاني',
                                      size: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 255, 0, 0),
                                    )
                                  // Check if sale price is null and regular price is not zero
                                  else if (Coursdetail.salePrice == null &&
                                      Coursdetail.regularPrice != 0)
                                    defText(
                                      text: Coursdetail.regularPrice
                                          .toString()
                                          .replaceAll('null', ''),
                                      size: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff333333),
                                    )
                                  // Otherwise, show regular and sale prices
                                  else
                                    Row(
                                      children: [
                                        defText(
                                          text: Coursdetail.regularPrice
                                              .toString()
                                              .replaceAll('null', ''),
                                          textDecoration:
                                              TextDecoration.lineThrough,
                                          size: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff333333),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(width: 10),
                                        defText(
                                          text: Coursdetail.salePrice
                                              .toString()
                                              .replaceAll('null', ''),
                                          size: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff333333),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/time.png'),
                              width: 45,
                              height: 45,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            defText(
                                text: ' الأوقات : ',
                                size: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)
                          ],
                        ),
                        //table//////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defText(
                                text: 'اسحب..',
                                size: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    decoration: BoxDecoration(
                                        // color: Color.fromARGB(255, 251, 161, 154),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                        )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    border: TableBorder.symmetric(
                                      inside: const BorderSide(
                                          width: 1,
                                          color: Colors.black45,
                                          style: BorderStyle.solid),
                                    ),

                                    sortColumnIndex: 0,
                                    //table column
                                    columns: const [
                                      DataColumn(
                                          label: Text(
                                        'اليوم',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'cairo',
                                            fontWeight: FontWeight.w600),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'الساعة',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'cairo',
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ],
                                    //table row
                                    rows: [
                                      DataRow(selected: true, cells: [
                                        DataCell(Text(
                                          'الأحد',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                        DataCell(Text(
                                          '${Coursdetail.sundayEndTime} - ${Coursdetail.sundayEndTime}',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                      ]),
                                      DataRow(selected: true, cells: [
                                        DataCell(Text(
                                          'الإثنين ',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                        DataCell(Text(
                                          '${Coursdetail.mondayStartTime} - ${Coursdetail.mondayEndTime}',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                      ]),
                                      DataRow(selected: true, cells: [
                                        DataCell(Text(
                                          'الثلاثاء ',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                        DataCell(Text(
                                          '${Coursdetail.thursdayStartTime} - ${Coursdetail.thursdayEndTime}',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                      ]
                                          //selected: true,
                                          ),
                                      DataRow(selected: true, cells: [
                                        DataCell(Text(
                                          'الأربعاء',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                        DataCell(Text(
                                          '${Coursdetail.wednesdayStartTime} - ${Coursdetail.wednesdayEndTime}',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    decoration: BoxDecoration(
                                        // color: Color.fromARGB(255, 251, 161, 154),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(0),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                        )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    border: TableBorder.symmetric(
                                      inside: const BorderSide(
                                          width: 1,
                                          color: Colors.black45,
                                          style: BorderStyle.solid),
                                    ),

                                    sortColumnIndex: 0,
                                    //table column
                                    columns: const [
                                      DataColumn(
                                          label: Text(
                                        'اليوم',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'cairo',
                                            fontWeight: FontWeight.w600),
                                      )),
                                      DataColumn(
                                          label: Text(
                                        'الساعة',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'cairo',
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ],
                                    //table row
                                    rows: [
                                      DataRow(selected: true, cells: [
                                        DataCell(Text(
                                          'الخميس',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                        DataCell(Text(
                                          '${Coursdetail.thursdayStartTime} - ${Coursdetail.thursdayEndTime}',
                                          style: TextStyle(fontFamily: 'cairo'),
                                        )),
                                      ]
                                          //selected: true,
                                          ),
                                     DataRow(
                                          selected: true,
                                          //  color: MaterialStatePropertyAll(Color.fromARGB(255, 251, 161, 154)),
                                          cells: [
                                            DataCell(Text(
                                              'السبت',
                                              style: TextStyle(
                                                  fontFamily: 'cairo'),
                                            )),
                                            DataCell(Text(
                                              Coursdetail.saturdayStartTime == null ? 'مغلق' : '${Coursdetail.saturdayStartTime} - ${Coursdetail.saturdayStartTime}',
                                              style: TextStyle(
                                                  fontFamily: 'cairo'),
                                            )),
                                          ]
                                          //selected: true,
                                          ),
                                      DataRow(
                                          selected: true,
                                          //  color: MaterialStatePropertyAll(Color.fromARGB(255, 251, 161, 154)),
                                          cells: [
                                            DataCell(Text(
                                              'السبت',
                                              style: TextStyle(
                                                  fontFamily: 'cairo'),
                                            )),
                                            DataCell(Text(
                                              '${Coursdetail.saturdayStartTime} - ${Coursdetail.saturdayStartTime}',
                                              style: TextStyle(
                                                  fontFamily: 'cairo'),
                                            )),
                                          ]
                                          //selected: true,
                                          ),
                                      DataRow(
                                          selected: true,
                                          //  color: MaterialStatePropertyAll(Color.fromARGB(255, 251, 161, 154)),
                                          cells: const [
                                            DataCell(Text(
                                              '',
                                              style: TextStyle(
                                                  fontFamily: 'cairo'),
                                            )),
                                            DataCell(Text(
                                              '',
                                              style: TextStyle(
                                                  fontFamily: 'cairo'),
                                            )),
                                          ]
                                          //selected: true,
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                // Row(children: [
                                //   defText(text: 'بدء التسجيل : ', size: 18, fontWeight: FontWeight.w700, color: Colors.black),
                                //   const SizedBox(width: 20,),
                                //   defText(text: '15/10/2022', size: 18, fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                                // ],),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defText(
                                        text: 'بدء التسجيل :',
                                        size: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    // const SizedBox(width: 25,),
                                    defText(
                                        text: Coursdetail.registerOpen,
                                        size: 18,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF333333)),
                                  ],
                                ),
                                Container(
                                  height: 0.5,
                                  width: double.infinity,
                                  color: Colors.black54,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defText(
                                        text: 'انتهاء التسجيل :',
                                        size: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    //const SizedBox(width: 25,),
                                    defText(
                                        text: Coursdetail.registerClose,
                                        size: 18,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF333333)),
                                  ],
                                ),
                                Container(
                                  height: 0.5,
                                  width: double.infinity,
                                  color: Colors.black54,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defText(
                                        text: 'بدء الدورة :',
                                        size: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    //const SizedBox(width: 25,),
                                    defText(
                                        text: Coursdetail.startAt,
                                        size: 18,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF333333)),
                                  ],
                                ),
                                Container(
                                  height: 0.5,
                                  width: double.infinity,
                                  color: Colors.black54,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defText(
                                        text: 'عدد الساعات :',
                                        size: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    //const SizedBox(width: 25,),
                                    defText(
                                        text: Coursdetail.hours.toString(),
                                        size: 18,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF333333)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Image(
                              image:
                                  AssetImage('assets/images/teacherIcon.png'),
                              width: 45,
                              height: 45,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            defText(
                                text: ' المدرسين : ',
                                size: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            //
                            ...Coursdetail.teachers.map(
                              (teacher) => Row(
                                children: [
                                  defText(
                                      text: '-',
                                      size: 15,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff333333)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  defText(
                                      text: teacher,
                                      size: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff333333)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Image(
                              image:
                                  AssetImage('assets/images/locationIcon.png'),
                              width: 45,
                              height: 45,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: defText(
                                  text: Coursdetail.address,
                                  size: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Image(
                              image:
                                  AssetImage('assets/images/CourseTopics.png'),
                              width: 45,
                              height: 45,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            defText(
                                text: 'المحاور الأساسية :',
                                size: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Image(
                              image: AssetImage('assets/images/checkIcon.png'),
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            defText(
                                text: Coursdetail.mainPoints,
                                size: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff333333))
                          ],
                        ),

                        ///TextButton///
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           Done()));
                            },
                            child: Container(
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: const Color(0xff0163E2)),
                                child: Center(
                                  child: defText(
                                      text: 'احجز مقعدك الأن',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                        // defaultButton(
                        //     width: double.infinity,
                        //     function: () {
                        //       Navigator.of(context)
                        //           .pushReplacementNamed(registrationForm.id);
                        //     },
                        //     text: 'سجل الدخول واحجز مقعدك الأن'),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

// DataRow(
//   selected: true,
//   cells: [
//     DataCell(
//       Text(
//         'الجمعة',
//         style: TextStyle(fontFamily: 'cairo'),
//       ),
//     ),
//     DataCell(
//       Text(
//         _getFridayHoursText(Coursdetail.fridayStartTime, Coursdetail.fridayEndTime),
//         style: TextStyle(fontFamily: 'cairo'),
//       ),
//     ),
//   ],
// ),


// // Define a function to get the formatted text for Friday hours
// String _getFridayHoursText(String startTime, String endTime) {
//   if (startTime == null && endTime == null) {
//     return 'مغلق';
//   } else if (startTime == null && endTime != null) {
//     return 'مغلق - $endTime';
//   } else if (startTime != null && endTime == null) {
//     return '$startTime - فراغ';
//   } else {
//     return '$startTime - $endTime';
//   }
// }