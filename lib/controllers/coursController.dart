// ignore_for_file: avoid_print, file_names, non_constant_identifier_names, duplicate_ignore, camel_case_types, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';
import 'package:courso/FireBase_Healper/FireBase_Healper.dart';
import 'package:courso/models/class.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseController {
  static Future<List<Course>> getNewCourses() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');  
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/course?new=true&&limit=6'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
        
      },
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
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/course?new=true'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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

class MyCourseController {
  static Future<List<Course>> getNewMyCourses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/user/courses'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/course?discount=true'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/institute'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/category/$idCat'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/category'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/course/$id'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/institute/$id'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
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

class RegisterController {
  static Future<String?> getNewRegister(
    // ignore: non_constant_identifier_names
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
    final fcmToken = await FirebaseHelper.createToken();
    final response = await http.post(
        //لجعل الباك يعطيني خرج json
        headers: {
          'accept': 'application/json',
        },
        body: {
          'email': email,
          'password': pass,
          "education_status": education_status,
          "socail_status": socail_status,
          "address": address,
          "nationality": nationality,
          "sex": sex,
          "birth_date": birth_date,
          "last_name": last_name,
          "first_name": first_name,
          "phone": phone,
          'fcm_token': fcmToken
        },
        Uri.parse('http://localhost:8000/api/register'));
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
    return 'الرجاء التأكد من صحة الحقول';
  }
}

class LoginController {
  static Future<String?> getNewLogin(
    String email,
    String pass,
  ) async {
    final fcmToken = await FirebaseHelper.createToken();
    final response = await http.post(
        //لجعل الباك يعطيني خرج json
        headers: {
          'accept': 'application/json',
        },
        body: {
          'email': email,
          'password': pass,
          'fcm_token': fcmToken
        },
        Uri.parse('http://localhost:8000/api/login'));
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
        headers: {
          'accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        body: {
          'content': content,
          'institute_id': institute_id
        },
        Uri.parse('http://localhost:8000/api/suggestion'));
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
  static Future<void> getNewlogout() async {
    final fcmToken = await FirebaseHelper.createToken();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
        body: {
          'fcm_token': fcmToken
        },
        //لجعل الباك يعطيني خرج json
        headers: {
          'accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        Uri.parse('http://localhost:8000/api/logout'));
    print(response.body);
    if (response.statusCode == 204) {
      await prefs.remove('token');
      FirebaseHelper.deleteToken();
    }
  }
}


class ProfileController {
  static Future<Profile> getNewprofile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/profile'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    print(response.body);
    //فك تشفير json
    //وتحويله الى ليست 'date'
    try {
      final pr = Profile.fromJson(
          jsonDecode(response.body)['user'] as Map<String, dynamic>);
      print(pr);
      return pr;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}


////////////////////////////++////////////
class SearchController {
  static Future<Search> getNewSearchCourses(String S) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/search?q=${S}'),
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    print(response.body);
    //فك تشفير json
    //وتحويله الى ليست 'date'

    try {
      final search =
          Search.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      print(search);
      return search;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
/////////////////////////////////////////////////////////////
class EditProfileController {
  static Future<String?> getNewEditProfile(
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
    final fcmToken = await FirebaseHelper.createToken();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
        //لجعل الباك يعطيني خرج json
        headers: {
          'accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        body: {
          'email': email,
          'password': pass,
          "education_status": education_status,
          "socail_status": socail_status,
          "address": address,
          "nationality": nationality,
          "sex": sex,
          "birth_date": birth_date,
          "last_name": last_name,
          "first_name": first_name,
          "phone": phone,
          'fcm_token': fcmToken
        },
        Uri.parse('http://localhost:8000/api/register'));
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
    return ' بوجد خطأ ';
  }
}

class RegisterOnCoursController {
  static Future<String> getNewRegisterOnCours(int courseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/registeration/$courseId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'course_id': courseId,
      }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register for course.');
    }
  }
}
