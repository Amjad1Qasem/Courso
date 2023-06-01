// ignore_for_file: file_names, unnecessary_import, unused_import, avoid_print, duplicate_ignore

import 'package:courso/layout/Home_loayout/Home_layout.dart';
import 'package:courso/modules/LoginPages/Register/Register.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../shared/components/components.dart';
// import 'package:email_validator/email_validator.dart';

var emailcontroller = TextEditingController();
var passcontroller = TextEditingController();
var formkey = GlobalKey<FormState>();
bool secure = true;

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = "Login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/Welcome-ra.png'),
                        width: 198,
                        height: 198,
                      ),
                      Column(
                        children: const [
                          Text(
                            'أهلاً بعودتك',
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('لنقم بتسجيل الدخول',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultTextFormField(
                  hintText: 'example@gmail.com',
                  sufixfun: () {
                    setState(() {});
                    return null;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: ' email must not be empty'),
                    MinLengthValidator(8,
                        errorText: 'email must be at least 8 digits long'),
                    // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'email must have at least one special character')
                  ]),
                  radius: 15,
                  controller: emailcontroller,
                  keyboard: TextInputType.emailAddress,
                  labText: 'الايميل',
                  prifix: Icons.email,
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultTextFormField(
                  hintText: ' ',
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'password must not be empty'),
                    MinLengthValidator(8,
                        errorText: 'password must be at least 8 digits long'),

                    // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'password must have at least one special character')
                  ]),
                  controller: passcontroller,
                  keyboard: TextInputType.visiblePassword,
                  labText: 'كلمة المرور',
                  radius: 15,
                  prifix: Icons.lock,
                  sufix: secure ? Icons.visibility : Icons.visibility_off,
                  sufixfun: () {
                    setState(() {
                      secure = !secure;
                    });
                    return null;
                  },
                  securTrue: secure,
                ),
               
                const SizedBox(
                  height: 40,
                ),
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      print('object');
                    },
                    child: defaultButton(
                      width: 242,
                      text: 'تسجيل الدخول',
                      function: () {
                        if (Form.of(context).validate()) {
                          Form.of(context).save();
                          // ignore: avoid_print
                          print(emailcontroller.text);
                          // ignore: avoid_print
                          print(passcontroller.text);
                          Navigator.of(context).pushReplacementNamed(Home_Layout.id);
                        }
                        return null;
                      },
                    ),
                  );
                }),
             
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      ' لا تملك حساب ? ',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'cairo',
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Register.id);
                         emailcontroller.clear();
                        passcontroller.clear();
                      },
                      child: const Text(
                        'سجل الان',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'cairo',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 1,
                  color: const Color(0xff333333).withOpacity(0.3),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
