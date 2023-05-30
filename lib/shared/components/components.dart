// ignore_for_file: avoid_print, prefer_const_constructors, unused_import

import 'package:courso/modules/Category/categoryCourses.dart';
import 'package:courso/modules/Cours%20Details/CoursDetails.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../modules/Instuites/instuites.dart';
import 'package:courso/modules/Cours%20Details/RegistrationForm.dart';





// Button Login
Widget defaultButton({
  required double width,
  required Function? Function() function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF0163E2),
        ),
        alignment: Alignment.center,
        height: 50,
        width: width,
        child: Center(
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'cairo',
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

//TextFormField
Widget defaultTextFormField(
  {
  required TextEditingController controller,
  required TextInputType keyboard,
  required String labText,
  required double radius,
   MultiValidator? validator,
  required Function? Function() sufixfun,
  required String hintText,
  IconData? sufix,
  IconData? prifix,
  bool securTrue = false,
}) =>
    TextFormField(
      
      //cursorColor: Colors.red,
      validator: validator!,
      style: const TextStyle(
        color: Color(0xFF333333),
        
      ),
      obscureText: securTrue,
      controller: controller,
      keyboardType: keyboard,   
      decoration: InputDecoration(
      focusColor: Colors.deepOrange,  
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        filled: true,
        fillColor: const Color(0xffCFD9F0),
        labelText: labText,
        labelStyle: const TextStyle(fontFamily: 'cairo',fontSize: 20
        ,color:Colors.black54),
        prefixIcon: Icon(prifix,color: Colors.black54),
        suffixIcon: sufix != null
            ? IconButton(onPressed: sufixfun, icon: Icon(sufix))
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );

//apppar
Widget defaultApppar({
  required String title,
}) =>
    AppBar(
      backgroundColor: const Color(0xFF72A7EE),
      elevation: 0.2,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'cairo',
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      // actions: [
      //   IconButton(
      //     alignment: Alignment.centerRight,
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new_rounded,

      //       color: Colors.white,
      //       size: 30,
      //     ),
      //     onPressed: (){},
      //     )],
    );

// Coures
Widget cours({
  required ImageProvider coursImage,
  required String coursName,
   String ?instutName,
  required String typeCours,
    // required String  t='Details.id',
    // required BuildContext con,
}) =>
    Center(
      child: GestureDetector(
        onTap: () {
         // Navigator.of(con).pushReplacementNamed(t);
                  },
        child: Container(
          height: 215,
          width: 155,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 0)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        image: coursImage,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 125,
                      ),
                    ),
                    Container(
                      width: 44,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: typeCours != 'free'
                              ? null
                              : const Color(0xffFF0F00).withOpacity(0.5)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 44,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: typeCours != "free"
                                ? null
                                : const Color(0xffFF0F00).withOpacity(0.5)),
                        child: Text(
                          typeCours.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      coursName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      instutName!,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

//instuit
Widget instuitee({
  ImageProvider? instImage,
  String? instName,
  String? aboutInst,
}) =>
    Center(
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Instuites()),
          // );
        },
        child: Container(
          height: 225,
          width: 155,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 0)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        image: instImage!,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 125,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    instName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    aboutInst!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

//Text
Widget defText({
  required String text,
  required double size,
  required FontWeight fontWeight,
  required Color color,
  TextDecoration? textDecoration,
}) =>
    Text(
      text,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: textDecoration,
        fontFamily: 'cairo',
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );

//category
Widget category({
  required ImageProvider categoryImage,
  required String categoryName,
}) =>
    Center(
      child: GestureDetector(
        onTap: () {
        //     Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => CategoryCourses()),
        //   );
        },
        child: Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: categoryImage,
                      fit: BoxFit.contain,
                      width: 150,
                      height: 80,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    categoryName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
