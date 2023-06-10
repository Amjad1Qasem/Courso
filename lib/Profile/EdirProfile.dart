// ignore_for_file: file_names

import 'package:courso/modules/LoginPages/Register/Register.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

var firstnameregcontroller = TextEditingController();
var lastnameregcontroller = TextEditingController();
var birthdateregcontroller = TextEditingController();
var phoneregcontroller = TextEditingController();
var emailregcontroller = TextEditingController();
var passcontroller = TextEditingController();
var formkey = GlobalKey<FormState>();

bool secure = true;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f7ff),
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        title: const Text(
          ' تعديل المعلومات الشخصية',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key:  formkey,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/userImagepng.png'),
                        radius: 75,
                      ),
                      CircleAvatar(
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defText(
                              text: 'الاسم :',
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultTextFormField(
                        hintText: ' ',
                        sufixfun: () {
                          return null;
                        },
                        validator: MultiValidator([
                          //RequiredValidator(errorText: 'حقل الاسم اجباري'),
                          // MinLengthValidator(8,
                          //     errorText:
                          //         'first name must be at least 8 digits long'),
                      
                          // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                        ]),
                        radius: 10,
                        controller: firstnameregcontroller,
                        keyboard: TextInputType.name,
                        labText: ' ',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defText(
                              text: 'الكنية :',
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultTextFormField(
                        hintText: ' ',
                        sufixfun: () {
                          return null;
                        },
                        validator: MultiValidator([
                          //RequiredValidator(errorText: 'حقل الكنية اجباري'),
                          // MinLengthValidator(8,
                          //     errorText:
                          //         'first name must be at least 8 digits long'),
                      
                          // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                        ]),
                        radius: 10,
                        controller: lastnameregcontroller,
                        keyboard: TextInputType.name,
                        labText: ' ',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defText(
                              text: 'تاريخ الميلاد :',
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                        Stack(
                            children: [
                              
                               defaultTextFormField(
                            hintText: ' ',
                            sufixfun: () {
                            },
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'حقل تاريخ الميلاد اجباري'),
                              // MinLengthValidator(8,
                              //     errorText:
                              //         'first name must be at least 8 digits long'),
                              // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                            ]),
                            radius: 10,
                            controller: birthdateregcontroller,
                            keyboard: TextInputType.number,
                            labText: ' ',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8,right:5),
                            child: GestureDetector(
                              onTap: () async {
                                final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 30)),
                                );
                                if (dateTime != null) {
                                  setState(() {
                                    birthdateregcontroller.text =
                                        '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                                  });
                                }
                              },
                              child: 
                              const Icon(Icons.date_range),
                              ),
                          ),
                            ],
                          ),
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defText(
                              text: 'رقم الهاتف  :',
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultTextFormField(
                        hintText: '_ _ _ _ _ _ _ _ _ _  963+',
                        sufixfun: () {
                          return null;
                        },
                        validator: MultiValidator([
                          // RequiredValidator(
                          //   errorText: 'حقل رقم الهاتف اجباري',
                          // ),
                          // MinLengthValidator(
                          //   10,errorText:
                          //         'first name must be at least 10 digits long'),
                          // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                        ]),
                        radius: 10,
                        controller: phoneregcontroller,
                        keyboard: TextInputType.phone,
                        labText: ' ',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defText(
                              text: 'الايميل :',
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultTextFormField(
                        hintText: 'example@gmail.com',
                        sufixfun: () {
                          return null;
                        },
                        validator: MultiValidator([]),
                        radius: 10,
                        controller: emailregcontroller,
                        keyboard: TextInputType.name,
                        labText: ' ',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defText(
                              text: 'كلمة المرور :',
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       defaultTextFormField(
                      hintText: ' ',
                      validator: MultiValidator([
                     //   RequiredValidator(errorText: 'password must not be empty'),
                        // MinLengthValidator(8,
                        //     errorText: 'password must be at least 8 digits long'), 
                        // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'password must have at least one special character')
                      ]),
                      controller: passcontroller,
                      keyboard: TextInputType.visiblePassword,
                      labText: 'كلمة المرور',
                      radius: 10,
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
                    ],
                  ),
                  const SizedBox(height: 20,),
                     Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        // ignore: avoid_print
                        print('object');
                      },
                      child: defaultButton(
                        width: 242,
                        text: 'تأكيد',
                        function: () {
                          if (Form.of(context).validate()) {
                            Form.of(context).save();
                            // ignore: avoid_print
                            print(emailcontroller.text);
                            // ignore: avoid_print
                            print(passcontroller.text);
                            
                          }
                          return null;
                        },
                      ),
                    );
                  }),     
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

