// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';


import 'package:courso/models/class.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CourseController {
  static Future<List<Course>> getNewCourses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
    final token = prefs.getString('token');
    final response = await http
    
        .get(Uri.parse('http://10.0.2.2:8000/api/course?new=true&&limit=6'),
         headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
     final token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/course?new=true'),
             headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
     final token = prefs.getString('token');
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/course?discount=true'),
             headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
    print(response.body);
    return (jsonDecode(response.body)['data'] as List)
        .map((json) => Sale.fromJson(json))
        .toList();
  }
}

class InstituteController {
  static Future<List<Institute>> getNewInstitutes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
     final token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/institute'),
             headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
    print(response.body);
    return (jsonDecode(response.body)['data'] as List)
        .map((json) => Institute.fromJson(json))
        .toList();
  }
}

class CategoryController {
  static Future<List<Course>> getNewCategory(int idCat) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
     final token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/category/$idCat'),
             headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
    print(response.body);
    return (jsonDecode(response.body)['data']['courses'] as List)
        .map((json) => Course.fromJson(json))
        .toList();
  }
}

class CategoryCoursController {
  static Future<List<Categor>> getNewCategoryCours() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
     final token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/category'),
             headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
    print(response.body);
    return (jsonDecode(response.body)['data'] as List)
        .map((json) => Categor.fromJson(json))
        .toList();
  }
}

class CoursDetailsController {
  static Future<CourseDetails> getNewDetails(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
     final token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/course/$id'),
             headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
     final token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/institute/$id'),
             headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        );
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

class LoginController {
  static Future<String?> getNewLogin(
    String email,
    String pass,
  ) async {
    final response = await http.post(
        //لجعل الباك يعطيني خرج json 
        headers: {'accept': 'application/json' ,},

        body: {'email': email, 'password': pass},
        Uri.parse('http://10.0.2.2:8000/api/login'));
    print(response.body);
    //200 status =ok
    //300 > 50/100 error/ok
    //400> 100/100 error
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'] as String;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return null;
    }
    return 'الايميل أو كلمة المرور خطأ';
  }
}


class RegisterController {
  static Future<String?> getNewRegister(
    String first_name,
    String last_name,
    String birth_date,
    String phone,
    String sex,
    String nationality,
    String address,
    String email,
    String pass,
    String education_status,
    String socail_status,
  ) async {
   
    final response = await http.post(
        //لجعل الباك يعطيني خرج json 
        headers: {'accept': 'application/json' , },
        body: {
         'email': email,
         'password': pass,
          "education_status":education_status,
          "socail_status":socail_status,
          "address":address,
          "nationality":nationality,
          "sex":sex,
          "birth_date":birth_date,
          "last_name":last_name,
          "first_name":first_name,
          "phone":phone,
           
        },
        Uri.parse('http://10.0.2.2:8000/api/register'));
    print(response.body);
    //200 status =ok
    //300 > 50/100 error/ok
    //400> 100/100 error
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'] as String;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return null;
    }
    return 'هذا الايميل موجود بالفعل';
  }
}


class suggestionController {
  static Future<String?> getNewsuggestion(
    String content,
    // ignore: non_constant_identifier_names
    String institute_id,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
    final token = prefs.getString('token');
    final response = await http.post(
        //لجعل الباك يعطيني خرج json 
        headers: {'accept':'application/json' ,  HttpHeaders.authorizationHeader :'Bearer $token'},
        body: {'content': content,'institute_id':institute_id},
        Uri.parse('http://10.0.2.2:8000/api/suggestion'));
    print(response.body);
    //200 status =ok
    //300 > 50/100 error/ok
    //400> 100/100 error
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'] as String;
    
      await prefs.setString('token', token);
      return null;
    }
    return null;
    
  }
}



class LogOutController {
  static Future<void> getNewlogout(
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
        //لجعل الباك يعطيني خرج json 
        headers: {'accept': 'application/json' , HttpHeaders.authorizationHeader :'Bearer $token'},    
        Uri.parse('http://10.0.2.2/api/logout'));
    print(response.body);
    if (response.statusCode == 204) {
      await prefs.remove('token');
    }
  }
}