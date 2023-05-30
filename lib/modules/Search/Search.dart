// ignore_for_file: file_names, non_constant_identifier_names, unused_import

import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

var Searchcontroller = TextEditingController();

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Map<String, dynamic>> allCourses = [
    {
      "id": 1,
      "CoursName": 'دورة CCNA',
      "The Instuit": 'الجمعية المعلوماتية السورية'
    },
    {
      "id": 2,
      "CoursName": 'إدارة الموارد البشرية',
      "The Instuit": 'مركز الأمين'
    },
    {"id": 3, "CoursName": 'التوعية الصحية', "The Instuit": 'منظمة اليونسيف'},
    {"id": 4, "CoursName": 'التسويق الالكتروني', "The Instuit": 'معهد الأمين'},
    {
      "id": 5,
      "CoursName": 'UI/UX desgin',
      "The Instuit": 'معهد DTC (الاونروا)'
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> foundCours = [];
  @override
  initState() {
    // at the beginning, all users are shown
    foundCours = allCourses;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allCourses;
    } else {
      results = allCourses
          .where((user) => user["CoursName"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundCours = results;
    });
  }

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
        padding: const EdgeInsetsDirectional.only(start: 20, end: 5, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu_rounded,
                      size: 40,
                      color: Colors.black54,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: foundCours.isNotEmpty
                  ? ListView.builder(
                      itemCount: foundCours.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(foundCours[index]["id"]),
                        color: const Color(0xffffffff),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            foundCours[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, fontFamily: 'cairo'),
                          ),
                          title: Text(
                            foundCours[index]['CoursName'],
                            style: const TextStyle(
                              fontFamily: 'cairo',
                            ),
                          ),
                          subtitle: Text(
                            '${foundCours[index]["The Instuit"]}',
                            style: const TextStyle(
                              fontFamily: 'cairo',
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
