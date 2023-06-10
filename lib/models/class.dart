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

class Categor {
  int id;
  String name;
  String image;

  Categor({
     required this.id,
     required this.name, 
     required this.image
     
      });

  factory Categor.fromJson(Map<String, dynamic> json) {
    return Categor(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}

class CourseDetails {
  int id;
  String name;
  String image;
  String description;
  int instituteId;
  String instituteName;
  String instituteImage;
  List<String> teachers;
  int  regularPrice;
  int ? salePrice;
  String ? sundayStartTime;
  String ? sundayEndTime;
  String ? mondayStartTime;
  String ? mondayEndTime;
  String ? tuesdayStartTime;
  String ? tuesdayEndTime;
  String ? wednesdayStartTime;
  String ? wednesdayEndTime;
  String ? thursdayStartTime;
  String ? thursdayEndTime;
  String ? fridayStartTime;
  String ? fridayEndTime;
  String ? saturdayStartTime;
  String ? saturdayEndTime;
  String address;
  String mainPoints;
  String registerOpen;
  String registerClose;
  int hours;
  String startAt;

  CourseDetails({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.instituteId,
    required this.instituteName,
    required this.instituteImage,
    required this.teachers,
    required this.regularPrice,
    required this.salePrice,
    required this.sundayStartTime,
    required this.sundayEndTime,
    required this.mondayStartTime,
    required this.mondayEndTime,
    required this.tuesdayStartTime,
    required this.tuesdayEndTime,
    required this.wednesdayStartTime,
    required this.wednesdayEndTime,
    required this.thursdayStartTime,
    required this.thursdayEndTime,
    required this.fridayStartTime,
    required this.fridayEndTime,
    required this.saturdayStartTime,
    required this.saturdayEndTime,
    required this.address,
    required this.mainPoints,
    required this.registerOpen,
    required this.registerClose,
    required this.hours,
    required this.startAt,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    return CourseDetails(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      instituteId: json['institute_id'],
      instituteName: json['institute_name'],
      instituteImage: json['institute_image'],
      teachers: List<String>.from(json['teachers']),
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
     sundayStartTime: json['sunday_start_time'],
      sundayEndTime: json['sunday_end_time'],
      mondayStartTime: json['monday_start_time'],
      mondayEndTime: json['monday_end_time'],
      tuesdayStartTime: json['tuesday_start_time'],
      tuesdayEndTime: json['tuesday_end_time'],
      wednesdayStartTime: json['wednesday_start_time'],
      wednesdayEndTime: json['wednesday_end_time'],
      thursdayStartTime: json['thursday_start_time'],
      thursdayEndTime: json['thursday_end_time'],
      fridayStartTime: json['friday_start_time'],
      fridayEndTime: json['friday_end_time'],
      saturdayStartTime: json['saturday_start_time'],
      saturdayEndTime: json['saturday_end_time'],
      address: json['address'],
      mainPoints: json['main_points'],
      registerOpen: json['register_open'],
      registerClose: json['register_close'],
      hours: json['hours'],
      startAt: json['start_at'],
    );
  }
}






class InstituteDetails {
  int id;
  String name;
  String image;
  String description;
  String address;
  String website;
  String phone;
  String facebook;
  List<dynamic> currentCourses;
  List<ComingCourse> comingCourses;

  InstituteDetails({
   required this.id,
   required this.name,
   required this.image,
   required this.description,
   required this.address,
   required this.website,
   required this.phone,
   required this.facebook,
   required this.currentCourses,
   required this.comingCourses,
  });

  factory InstituteDetails.fromJson(Map<String, dynamic> json) {
    var comingCoursesList = json['coming_courses'] as List;
    List<ComingCourse> comingCourses =
        comingCoursesList.map((e) => ComingCourse.fromJson(e)).toList();

         var currentCoursesList = json['current_courses'] as List;
    List<ComingCourse> currentCourses =
        currentCoursesList.map((e) => ComingCourse.fromJson(e)).toList();

    return InstituteDetails(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      address: json['address'],
      website: json['website'],
      phone: json['phone'],
      facebook: json['facebook'],
      currentCourses: currentCourses,
      comingCourses: comingCourses,
    );
  }
}

class ComingCourse {
  int id;
  String name;
  String image;
  String institute;
  bool isFree;

  ComingCourse({
   required this.id,
   required this.name,
   required this.image,
   required this.institute,
   required this.isFree,
  });

  factory ComingCourse.fromJson(Map<String, dynamic> json) {
    return ComingCourse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      institute: json['institute'],
      isFree: json['is_free'],
    );
  }
}















// class CoursModel {
//   final ImageProvider coursImage;
//   final String coursName;
//   final String instutName;
//   final String typeCours;
//   // static var length;

//   CoursModel({
//     required this.coursImage,
//     required this.coursName,
//     required this.instutName,
//     required this.typeCours,
//   });

//   get id => null;
// }

class CategoryModel {
  final ImageProvider categoryImage;
  final String categoryName;

  CategoryModel({
    required this.categoryImage,
    required this.categoryName,
  });
}

class InstuitModel {
  final ImageProvider instImage;
  final String instName;
  final String aboutInst;

  InstuitModel({
    required this.instImage,
    required this.instName,
    required this.aboutInst,
  });
}
