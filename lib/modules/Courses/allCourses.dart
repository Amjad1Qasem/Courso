// ignore_for_file: prefer_const_constructors, must_be_immutable, unused_import, file_names, avoid_print

import 'package:courso/controllers/coursController.dart';
import 'package:courso/modules/Cours%20Details/CoursDetails.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../models/class.dart';

class AllCourses extends StatelessWidget {
  AllCourses({super.key});

  // List<CoursModel> courss = [
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C8.png'),
  //     coursName: 'UI/UX desgin',
  //     instutName: 'معهد DTC (الاونروا)',
  //     typeCours: '',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C1.png'),
  //     coursName: 'التوعية الصحية',
  //     instutName: 'منظمة اليونسيف',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C9.png'),
  //     coursName: 'التسويق الالكتروني',
  //     instutName: 'معهد الأمين',
  //     typeCours: '',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C2.png'),
  //     coursName: 'قيادة الحاسب ICDL',
  //     instutName: 'معهد رواد الحضارة',
  //     typeCours: '',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C10png.png'),
  //     coursName: 'المحاسبة',
  //     instutName: 'معهد الأمين',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C3.png'),
  //     coursName: 'دورة CCNA',
  //     instutName: 'الجمعية المعلوماتية السورية',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C11.png'),
  //     coursName: 'تعلم لغة MY SQL',
  //     instutName: 'معهد الهمك',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C4.png'),
  //     coursName: 'تأهيل المرأة',
  //     instutName: 'UNICEF',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C12.png'),
  //     coursName: 'احتراف برامج Adobe',
  //     instutName: 'مؤسسة الشام',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C5.png'),
  //     coursName: 'الفيزياء',
  //     instutName: 'معهد الناجي',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C13.png'),
  //     coursName: 'الذكاء الاصطناعي',
  //     instutName: 'مركز الاتقان',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C6.png'),
  //     coursName: 'إدارة الموارد البشرية',
  //     instutName: 'مركز الأمين',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C14.png'),
  //     coursName: 'دورة C# (oop)',
  //     instutName: 'معهد  DTC (الاونروا)',
  //     typeCours: 'free',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C7.png'),
  //     coursName: 'English',
  //     instutName: 'New Horizons',
  //     typeCours: ' ',
  //   ),
  //   CoursModel(
  //     coursImage: AssetImage('assets/images/C15.png'),
  //     coursName: 'دورة بايثون متقدمة',
  //     instutName: 'معهد الهمك',
  //     typeCours: '',
  //   ),
  // ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        title: const Text(
          'الدورات',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Course>>(
          future: AllCourseController.getNewAllCourses(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final courses = snapshot.data!;
            return GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 10 / 16,
                  crossAxisCount: 3,
                ),
                itemCount: courses.length,
                itemBuilder: (context, index) => buildCours(courses[index]));
          }),
    );
  }
}

bool isFree = false;
// Build Item for list

Widget buildCours(Course course) => AllCourseItem(course: course,);

class AllCourseItem extends StatelessWidget {
  final Course course;
  const AllCourseItem({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Details(CoursId:course.id,)));
      },
      child: Center(
        child: Container(
          height: 200,
          width: 117,
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
            mainAxisSize: MainAxisSize.max,

            //  crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          image: NetworkImage(course.image),
                          fit: BoxFit.cover,
                          width: 115,
                          height: 120,
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: isFree
                                ? const Color(0xffFF0F00).withOpacity(0.5)
                                : null),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 44,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: isFree
                                  ? const Color(0xffFF0F00).withOpacity(0.5)
                                  : null),
                          child: Text(
                            isFree ? 'مجاني' : '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
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
                      course.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      course.institute,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
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
  }
}
