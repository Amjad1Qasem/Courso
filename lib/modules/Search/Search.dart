// ignore_for_file: file_names, non_constant_identifier_names, unused_import, library_prefixes, duplicate_ignore

import 'package:courso/controllers/coursController.dart';
import 'package:courso/models/class.dart';
import 'package:courso/modules/Cours%20Details/CoursDetails.dart';
import 'package:courso/modules/Instuites/InstuitPage.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                      //       size: 40, v   
                      //       color: Colors.black54,
                      //     ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(              
                    child: Expanded(
                      child: Column(
                          children: search?.courses
                                  .map((course) => MySearchCour(
                                        coursImage: NetworkImage(course.image),
                                        coursName: course.name,
                                        instutName: course.institute,
                                        isFree: course.isFree,
                                        courseId: course.id,
                                        context: context,
                                      ))
                                  .toList() ??[]
                                  ),
                    ),
                  ),
                              if(search!=null)
                              ...search!.institutes.map((institute) => 
              MySearchInst(instituteId: institute.id, instituteImage: NetworkImage(institute.image), InstutName: institute.name, description: institute.description, context: context)).toList(),
              ],
              ),
            ),
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
  required BuildContext context,
}) =>
    GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(CoursId:courseId)));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 10, bottom: 10),
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  
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
                          width: 145,
                          height: 120,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
              ),
             const  SizedBox(width: 10,),
              Expanded(flex: 2,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5,end: 15,top: 8,bottom: 10),
                        child: Text(
                          coursName,
                          style: const TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333333)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5,end: 15,top: 0,bottom: 5),
                        child: Text(
                          instutName,
                          style: const TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff333333)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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
      ),
    );
    
// ignore: non_constant_identifier_names
Widget MySearchInst({
  required int instituteId,
  required ImageProvider instituteImage,
  required String InstutName,
  required String description,
  required BuildContext context,
}) =>
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InstuitPage(insttuitId: instituteId,)));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 10, end: 10, top: 10, bottom: 10),
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
              Expanded(
                flex: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        // ignore: prefer_const_constructors
                        child: Image(
                          image: instituteImage,
                          width: 145,
                          height: 120,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5,end: 15,top: 8,bottom: 10),
                        child: Text(
                          InstutName,
                          style: const TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff333333)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign:TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5,end: 15,top: 0,bottom: 5),
                        child: Text(
                          description,
                          style: const TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff333333)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign:TextAlign.left,
                        ),
                      ),          
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
