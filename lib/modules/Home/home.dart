// ignore_for_file: prefer_const_constructors, avoid_print, unused_import, dead_code

import 'package:courso/controllers/coursController.dart';
import 'package:courso/modules/Cours%20Details/CoursDetails.dart';
import 'package:courso/modules/Courses/allCourses.dart';
import 'package:courso/modules/Courses/saleCourses.dart';
import 'package:courso/modules/Instuites/InstuitPage.dart';
import 'package:courso/modules/Instuites/instuites.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../models/class.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<CoursModel> courss = [
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C.png'),
  //     coursName: 'ssssdsd',
  //     instutName: 'dsd',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C.png'),
  //     coursName: 'aa',
  //     instutName: 'aa',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C.png'),
  //     coursName: 'ss',
  //     instutName: 'ss',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C.png'),
  //     coursName: 'dd',
  //     instutName: 'dd',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C5.png'),
  //     coursName: 'gg',
  //     instutName: 'gg',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C6.png'),
  //     coursName: 'ssssdsd',
  //     instutName: 'grgerg',
  //     typeCours: 'free',
  //   ),
  // ];

  double x0ffset = 0;
  double y0ffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(x0ffset, y0ffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: const Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(20)
              : BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[100]!.withOpacity(0.5),
              spreadRadius: 8,
              blurRadius: 15,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF72A7EE),
              elevation: 0.2,
              title: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/images/userImagepng.png'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Lisa Jain',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'cairo',
                      ),
                    ),
                  ],
                ),
              ),
              leading:
                  // [
                  // IconButton(
                  //     onPressed: () {
                  //       showSearch(
                  //         context: context,
                  //         delegate: CustomSearchDelegate(),
                  //       );
                  //     },
                  //     icon: Icon(Icons.search)),
                  isDrawerOpen
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              x0ffset = 0;
                              y0ffset = 0;
                              isDrawerOpen = false;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 25,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              x0ffset = -120;
                              y0ffset = -20;
                              isDrawerOpen = true;
                            });
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 25,
                          ),
                        ),
              // ],
            ),
            backgroundColor: const Color(0xffF2F7FF),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
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
                                  text: 'الدورات الجديدة',
                                  size: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              TextButton(
                                child: defText(
                                    text: 'عرض الكل',
                                    size: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>AllCourses())
                                  );
                                },
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FutureBuilder<List<Course>>(
                                  future: CourseController.getNewCourses(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final courses = snapshot.data!;
                                    return Row(
                                      children: courses
                                          .map((course) => cours(
                                                coursImage:
                                                    NetworkImage(course.image),
                                                coursName: course.name,
                                                instutName: course.institute,
                                                isFree: course.isFree,
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                                  text: 'الحسوم %',
                                  size: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              TextButton(
                                child: defText(
                                    text: 'عرض الكل',
                                    size: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>SaleCourses())
                                  );
                                },
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FutureBuilder<List<Sale>>(
                                  future: CourseSaleController.getNewSales(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final sales = snapshot.data!;
                                    return Row(
                                      children: sales
                                          .map((sale) => cours(
                                                coursImage:
                                                    NetworkImage(sale.image),
                                                coursName: sale.name,
                                                instutName: sale.institute,
                                                isFree: sale.isFree,
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                                  text: 'المعاهد والمنظمات',
                                  size: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              TextButton(
                                child: defText(
                                    text: 'عرض الكل',
                                    size: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                onPressed: () {
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>Instuites())
                                  );
                                },
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FutureBuilder<List<Institute>>(
                                  future:
                                      InstituteController.getNewInstitutes(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    final institutes = snapshot.data!;
                                    return Row(
                                      children: institutes
                                          .map((institute) => instuitee(
                                                instImage: NetworkImage(
                                                    institute.image),
                                                instName: institute.name,
                                                aboutInst:
                                                    institute.description,
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

// // search bar
// class CustomSearchDelegate extends SearchDelegate {
//   // ignore: non_constant_identifier_names
//   List<String> SearchCours = [
//     'التوعية الصحية',
//     'قيادة الحاسب ICDL',
//     'دورة CCNA',
//     'تأهيل المرأة',
//     'الفيزياء',
//     'إدارة الموارد البشرية',
//     'English',
//     'UI/UX desgin',
//     'المحاسبة',
//   ];

// //       To Clear Query        //
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

// //       To Close and Leave The Search Bar       //
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var cours in SearchCours) {
//       if (cours.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(cours);
//       }
//     }
//     return SingleChildScrollView(
//       child: ListView.builder(
//           itemCount: matchQuery.length,
//           itemBuilder: (context, index) {
//             final result = matchQuery[index];
//             return ListTile(
//               title: Text(
//                 result,
//                 style: TextStyle(fontFamily: 'cairo'),
//               ),
//               onTap: () {
//                 query = result;
//               },
//             );
//           }),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var cours in SearchCours) {
//       if (cours.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(cours);
//       }
//     }
//     return Center(
//       child: ListView.builder(
//           itemCount: matchQuery.length,
//           itemBuilder: (context, index) {
//             final result = matchQuery[index];
//             return ListTile(
//               title: Text(
//                 result,
//                 style: TextStyle(fontFamily: 'cairo'),
//               ),
//               onTap: () {
//                 query = result;
//               },
//             );
//           }),
//     );
//   }
// }


// // Build Item for list
//  Widget buildCours(CoursModel courses)=>
//  Center(
//       child: GestureDetector(
//         onTap: () {
//           print('pageCours');
//         },
//         child: Container(
//           height: 215,
//           width: 155,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey.withOpacity(0.7),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 0)),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: Image(
//                         image: courses.coursImage,
//                         fit: BoxFit.cover,
//                         width: 150,
//                         height: 125,
//                       ),
//                     ),
//                     Container(
//                       width: 44,
//                       height: 25,
//                       decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             bottomRight: Radius.circular(15),
//                           ),
//                           color: courses.typeCours!= 'free'
//                               ? null
//                               : const Color(0xffFF0F00).withOpacity(0.5)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Container(
//                         width: 44,
//                         height: 25,
//                         decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(15),
//                               bottomRight: Radius.circular(15),
//                             ),
//                             color: courses.typeCours != "free"
//                                 ? null
//                                 : const Color(0xffFF0F00).withOpacity(0.5)),
//                         child: Text(
//                           courses.typeCours.toUpperCase(),
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'cairo',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     courses.coursName,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'cairo',
//                       fontWeight: FontWeight.w900,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(7.0),
//                   child: Text(
//                     courses.instutName,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'cairo',
//                       fontWeight: FontWeight.w300,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
