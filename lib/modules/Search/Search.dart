// ignore_for_file: file_names, non_constant_identifier_names, unused_import, library_prefixes, duplicate_ignore

import 'package:courso/controllers/coursController.dart';
import 'package:courso/models/class.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:courso/models/class.dart' as Models;

var Searchcontroller = TextEditingController();

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Models.Search? search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color(0xfff2f7ff),
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        centerTitle: true,
        title: defText(
          text: 'البحث',
          size: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10,bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) async {
                      search =
                          await SearchController.getNewSearchCourses(value);
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xffCFD9F0),
                        labelStyle: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 20,
                            color: Colors.black54),
                        labelText: 'ابحث عم الدورات والمعاهد..',
                        prefixIcon: Icon(
                          Icons.search,
                          size: 40,
                          color: Colors.black45,
                        ),
                        //suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                  ),
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.menu_rounded,
                //       size: 40,
                //       color: Colors.black54,
                //     ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
                children: search?.courses
                        .map((course) => MySearchCour(
                              coursImage: NetworkImage(course.image),
                              coursName: course.name,
                              instutName: course.institute,
                              isFree: course.isFree,
                              courseId: course.id,
                            ))
                        .toList() ??[]
                        
                        ),
        // search?.institutes.map((institute) => MySearchInst(instituteId: institute.id, instituteImage: institute.image, InstutName: institute.name, description: institute.description).toList()??[]
        ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget MySearchCour({
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


// ignore: non_constant_identifier_names
Widget MySearchInst({
  required int instituteId,
  required ImageProvider instituteImage,
  required String InstutName,
  required String description,
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
                      image: instituteImage,
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
                      InstutName,
                      style: const TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff333333)),
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
