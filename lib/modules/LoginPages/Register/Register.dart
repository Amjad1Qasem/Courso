// ignore_for_file: file_names, unused_import

import 'package:form_field_validator/form_field_validator.dart';
import 'package:courso/modules/LoginPages/Login/Login.dart';
import 'package:flutter/material.dart';
import '../../../layout/Home_loayout/Home_layout.dart';
import '../../../shared/components/components.dart';

var firstnamecontroller = TextEditingController();
var lastnamecontroller = TextEditingController();
var phonecontroller = TextEditingController();
var emailcontroller = TextEditingController();
var passcontroller = TextEditingController();
var formkey = GlobalKey<FormState>();
bool secure = true;

class Register extends StatefulWidget {
  const Register({super.key});
  static String id = 'Register';
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/Hello-pana.png'),
                      width: 200,
                      height: 200,
                    ),
                    defaultTextFormField(
                      hintText: ' ',
                      sufixfun: () {
                        setState(() {});
                        return null;
                      },
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'first name must not be empty'),
                        // MinLengthValidator(8,
                        //     errorText:
                        //         'first name must be at least 8 digits long'),

                        // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                      ]),
                      radius: 15,
                      controller: firstnamecontroller,
                      keyboard: TextInputType.name,
                      labText: 'الاسم ',
                      prifix: Icons.person,
                    ),          
                    const SizedBox(
                      height: 10,
                    ),
                    defaultTextFormField(
                      hintText: ' ',
                      sufixfun: () {
                        setState(() {});
                        return null;
                      },
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'last name must not be empty'),
                        // MinLengthValidator(8,
                        //     errorText:
                        //         'last name must be at least 8 digits long'),

                        // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'last name must have at least one special character')
                      ]),
                      radius: 15,
                      controller: lastnamecontroller,
                      keyboard: TextInputType.emailAddress,
                      labText: 'الكنية',
                      prifix: Icons.person,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultTextFormField(
                      hintText: ' ',
                      sufixfun: () {
                        setState(() {});
                        return null;
                      },
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: ' phone must not be empty'),
                        MinLengthValidator(10,
                            errorText: 'phone must be at least 10 digits long'),
                        // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'phone must have at least one special character')
                      ]),
                      radius: 15,
                      controller: phonecontroller,
                      keyboard: TextInputType.number,
                      labText: 'الهاتف',
                      prifix: Icons.phone_android,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultTextFormField(
                      hintText: ' ',
                      sufixfun: () {
                        setState(() {});
                        return null;
                      },
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: ' email must not be empty'),
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
                      height: 10,
                    ),
                    defaultTextFormField(
                      hintText: ' ',
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'password must not be empty'),
                        MinLengthValidator(8,
                            errorText:
                                'password must be at least 8 digits long'),
                        // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
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
                      height: 5,
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          // ignore: avoid_print
                          print('object');
                        },
                        child: defaultButton(
                          width: 242,
                          text: 'إنشاء حساب',
                          function: () {
                            if (Form.of(context).validate()) {
                              Form.of(context).save();
                              // ignore: avoid_print
                              print(firstnamecontroller.text);
                              // ignore: avoid_print
                              print(lastnamecontroller.text);
                              // ignore: avoid_print
                              print(phonecontroller.text);
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
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [           
                        const Text(
                          'هل تملك حساب مسبقاً ?',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            firstnamecontroller.clear();
                            lastnamecontroller.clear();
                            phonecontroller.clear();
                            emailcontroller.clear();
                            passcontroller.clear();
                            Navigator.of(context)
                                .pushReplacementNamed(Login.id);
                          },
                          child: const Text(
                            'تسجيل الدخول',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'cairo',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      
                      ],
                    ),
                    Container(
                      width: 250,
                      height: 1,
                      color: const Color(0xff333333).withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
