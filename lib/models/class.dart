import 'package:flutter/material.dart';

class CoursModel {
  final ImageProvider coursImage;
  final String coursName;
  final String instutName;
  final String typeCours;

  // static var length;

  CoursModel({
    required this.coursImage,
    required this.coursName,
    required this.instutName,
    required this.typeCours,
  });
}

class CategoryModel {
  final ImageProvider categoryImage;
  final String categoryName;

  CategoryModel({
   required this.categoryImage,
   required this.categoryName,
  });

  
}

class InstuitModel{
  final ImageProvider instImage;
  final String instName;
  final String aboutInst;

  InstuitModel({
     required this.instImage,
     required this.instName,
     required this.aboutInst,
  });
}