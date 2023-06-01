import 'package:flutter/material.dart';

class Course {
  int id;
  String name;
  String image;
  String institute;
  bool isFree;

  Course({
    required this.id,
    required this.name,
    required this.image,
    required this.institute,
    required this.isFree,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      institute: json['institute'],
      isFree: json['is_free'],
    );
  }
}

class AllCourse {
  int id;
  String name;
  String image;
  String institute;
  bool isFree;

  AllCourse({
    required this.id,
    required this.name,
    required this.image,
    required this.institute,
    required this.isFree,
  });

  factory AllCourse.fromJson(Map<String, dynamic> json) {
    return AllCourse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      institute: json['institute'],
      isFree: json['is_free'],
    );
  }
}



class Sale {
  int id;
  String name;
  String image;
  String institute;
  bool isFree;

  Sale({
    required this.id,
    required this.name,
    required this.image,
    required this.institute,
    required this.isFree,
  });

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      // json هو اسم ال map
      id: json['id'],
      name: json['name'],
      image: json['image'],
      institute: json['institute'],
      isFree: json['is_free'],
    );
  }
}

class Institute {
  int id;
  String name;
  String image;
  String description;

  Institute({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Institute.fromJson(Map<String, dynamic> json) {
    return Institute(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
    );
  }
}








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