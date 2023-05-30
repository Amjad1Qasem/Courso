// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print, avoid_web_libraries_in_flutter, unused_import

import 'dart:math';
import 'package:courso/models/class.dart';
import 'package:courso/modules/Category/categoryCourses.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryModel> Listcategor = [
    CategoryModel(
      categoryImage: AssetImage('assets/images/catigory1.png'),
      categoryName: 'تنمية بشرية',
    ),
    CategoryModel(
      categoryImage: AssetImage('assets/images/catigory2.png'),
      categoryName: 'الرسم والتخطيط',
    ),
    CategoryModel(
      categoryImage: AssetImage('assets/images/catigory3.png'),
      categoryName: 'الطب',
    ),
    CategoryModel(
      categoryImage: AssetImage('assets/images/catigory4png.png'),
      categoryName: 'تكنولوجيا المعلومات',
    ),
    CategoryModel(
      categoryImage: AssetImage('assets/images/catigory5png.png'),
      categoryName: 'مصارف ومحاسبة',
    ),
    CategoryModel(
      categoryImage: AssetImage('assets/images/catigory6png.png'),
      categoryName: 'الرياضيات والفيزياء',
    ),
  ];
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        title: const Text(
          'التصنيفات',
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
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            //مسؤلة عن طول الايتم
            childAspectRatio: 10 / 16,
            crossAxisCount: 3),
        itemBuilder: (context, index) => category(
            categoryName: Listcategor[index].categoryName,
            categoryImage: Listcategor[index].categoryImage),
        itemCount: Listcategor.length,
      ),
    );
  }
}

Widget defCategory(CategoryModel categ) => Center(
      child: Container(
        // height: 140,

        // width: 120,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 0)),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          //crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Image(
                      image: categ.categoryImage,
                      fit: BoxFit.contain,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    categ.categoryName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
