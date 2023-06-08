// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:courso/models/class.dart';
import 'package:http/http.dart' as http;

class CourseController {
  static Future<List<Course>> getNewCourses() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/course?new=true&&limit=6'));
    print(response.body);
    //فك تشفير json
    //وتحويله الى ليست 'date'
    return (jsonDecode(response.body)['data'] as List)
        //تحويل كل عنصر من ال (json) الcours
        .map((json) => Course.fromJson(json))
        //   إضافة الكائنات المحولة إلى القائمة وإرجاعها
        .toList();
  }
}

class AllCourseController {
  static Future<List<Course>> getNewAllCourses() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/course?new=true'));
    print(response.body);
    //فك تشفير json
    //وتحويله الى ليست 'date'
    return (jsonDecode(response.body)['data'] as List)
        //تحويل كل عنصر من ال (json) الcours
        .map((json) => Course.fromJson(json))
        //   إضافة الكائنات المحولة إلى القائمة وإرجاعها
        .toList();
  }
}

class CourseSaleController {
  static Future<List<Sale>> getNewSales() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/course?discount=true'));
    print(response.body);
    return (jsonDecode(response.body)['data'] as List)
        .map((json) => Sale.fromJson(json))
        .toList();
  }
}

class InstituteController {
  static Future<List<Institute>> getNewInstitutes() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/institute'));
    print(response.body);
    return (jsonDecode(response.body)['data'] as List)
        .map((json) => Institute.fromJson(json))
        .toList();
  }
}

class CategoryController {
  static Future<List<Course>> getNewCategory(int idCat) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/category'));
    print(response.body);
    return (jsonDecode(response.body)['data'] as List)
        .map((json) => Course.fromJson(json))
        .toList();
  }
}


class CategoryCoursController {
  static Future<List<Categor>> getNewCategoryCours(
    
  ) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2/api/category/1'));
    print(response.body);
    return (jsonDecode(response.body)['data'] as List)
        .map((json) => Categor.fromJson(json))
        .toList();
  }
}

class CoursDetailsController {
  static Future<CourseDetails> getNewDetails(int id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/course/$id'));
    try {
      final courseDetail = CourseDetails.fromJson(
          jsonDecode(response.body)['data'] as Map<String, dynamic>);

      print(courseDetail);
      return courseDetail;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}


class InstituteDetailsController {
  static Future<InstituteDetails> getNewInstituteDetails(int id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/institute/$id'));
    try {
      final instituteDetails = InstituteDetails.fromJson(
          jsonDecode(response.body)['data'] as Map<String, dynamic>);

      print(instituteDetails);
      return instituteDetails;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}


