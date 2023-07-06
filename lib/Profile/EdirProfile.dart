// ignore_for_file: file_names, unused_import, non_constant_identifier_names, body_might_complete_normally_nullable, avoid_print, duplicate_ignore

import 'package:courso/Profile/profilePage.dart';
import 'package:courso/controllers/coursController.dart';
import 'package:courso/layout/Home_loayout/Home_layout.dart';
import 'package:courso/modules/LoginPages/Register/Register.dart';
import 'package:courso/shared/components/components.dart';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

var formkey = GlobalKey<FormState>();

bool secure = true;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  
var firstnameregcontroller = TextEditingController();
var lastnameregcontroller = TextEditingController();
var birthdateregcontroller = TextEditingController();
var phoneregcontroller = TextEditingController();
var locationregcontroller = TextEditingController();
var emailregcontroller = TextEditingController();
var passcontroller = TextEditingController();
String SocialStatus = 'لا أعمل';
String CertificateType = 'المرحلة الابتدائية';


@override
 void initState() {
    super.initState();
    
    ProfileController.getNewprofile().then((userdata){
    
    setState(() {
      firstnameregcontroller.text=userdata.firstName;

    lastnameregcontroller.text=userdata.lastName;

    emailregcontroller.text=userdata.email;

    locationregcontroller.text=userdata.address;

    nationalityregcontroller=userdata.nationality;
   
    phoneregcontroller.text=userdata.phone;
 
    birthdateregcontroller.text= '${userdata.birthDate.year}/${userdata.birthDate.month}/${userdata.birthDate.day}';

    SocialStatus=userdata.socialStatus;

    CertificateType=userdata.educationStatus;
    });
    //print(userdata.firstName);
    print(firstnamecontroller.text);
    return userdata;
    });

  }
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
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: 
    Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      // Stack(
                      //   alignment: Alignment.bottomRight,
                      //   children: [
                      //     const CircleAvatar(
                      //       backgroundImage:
                      //           AssetImage('assets/images/userImagepng.png'),
                      //       radius: 75,
                      //     ),
                      //     CircleAvatar(
                      //         child: IconButton(
                      //             onPressed: () {}, icon: const Icon(Icons.edit)))
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
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
                              RequiredValidator(errorText: 'حقل الاسم مطلوب'),
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
                              RequiredValidator(errorText: 'حقل الكنية مطلوب'),
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
                      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                              readonly: true, 
                              hintText: ' ',
                              sufixfun: () {},
                              validator: MultiValidator([
                                RequiredValidator(
                                
                                    errorText: 'حقل تاريخ الميلاد مطلوب'),
                               // MinLengthValidator(8,
                               //     errorText:
                               //         'first name must be at least 8 digits long'),
                               // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                              ]),
                              radius: 10,
                              prifix: Icons.date_range,
                              controller: birthdateregcontroller,
                              keyboard: TextInputType.number,
                              labText: ' ',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, right: 5),
                              child: GestureDetector(
                                onTap: () async {
                                  final DateTime? dateTime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2016),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2016)
                                        .add(const Duration(days: 30)),
                                  );
                                  if (dateTime != null) {
                                    setState(() {
                                      birthdateregcontroller.text =
                                          '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.date_range,
                                  color: Color(0xffcfd9f0),
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
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
                              RequiredValidator(
                                errorText: 'حقل رقم الهاتف مطلوب',
                              ),
                              MaxLengthValidator(10, 
                              errorText:'الموبايل يجب ان يكون 10 أرقام'),
                              MinLengthValidator(10,
                                  errorText: 'الموبايل يجب ان يكون 10 أرقام'),
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
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'حقل الايميل مطلوب'),
                               PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'الرجاء التحقق من هذا الحقل'),
                              MinLengthValidator(8,
                                  errorText: ' الايميل يجب ان لا يقل عن 8 محرف'),
                            ]),
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
                              RequiredValidator(errorText: 'حقل كلمة المرور مطلوب'),
                              MinLengthValidator(8,
                                  errorText: 'كلمة المرور يجب ان لا تقل عن 8 محرف'),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              defText(
                                  text: 'مكان الاقامة :',
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
                              RequiredValidator(
                                  errorText: 'حقل مكان الاقامة مطلوب'),
                            ]),
                            radius: 10,
                            controller: locationregcontroller,
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
                                  text: 'المستوى العلمي :',
                                  size: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding:
                                const EdgeInsetsDirectional.only(end: 6, start: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xff333333),
                                width: 1,
                              ),
                              color: const Color(0xffcfd9f0),
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              iconSize: 35,
                              items: [
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'المرحلة الابتدائية',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'المرحلة الابتدائية',
                                ),
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'المرحلة الاعدادية',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'المرحلة الاعدادية',
                                ),
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'المرحلة الثانوية',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'المرحلة الثانوية',
                                ),
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'المرحلة الجامعية',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'المرحلة الجامعية',
                                ),
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'ماجستير',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'ماجستير',
                                ),
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'دكتوراه',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'دكتوراه',
                                ),
                              ],
                              onChanged: (String? val) {
                                setState(() {
                                  CertificateType = val!;
                                });
                              },
                              value: CertificateType,
                            ),
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
                                  text: 'الوضع الاجتماعي :',
                                  size: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding:
                                const EdgeInsetsDirectional.only(end: 6, start: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xff333333),
                                width: 1,
                              ),
                              color: const Color(0xffcfd9f0),
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              iconSize: 35,
                              items: [
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'لا أعمل',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'لا أعمل',
                                ),
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'أعمل بدوام كامل',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'أعمل بدوام كامل',
                                ),
                                DropdownMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: defText(
                                      text: 'أعمل بدوام جزئي',
                                      size: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xf3333333)),
                                  value: 'أعمل بدوام جزئي',
                                ),
                              ],
                              onChanged: (String? val) {
                                setState(() {
                                  SocialStatus = val!;
                                });
                              },
                              value: SocialStatus,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print('object');
                          },
                          child: defaultButton(
                            width: 242,
                            text: 'تأكيد',
                            function: () async {
                              if (Form.of(context).validate()) {
                                Form.of(context).save();
                                final Error =
                                    await EditProfileController.getNewEditProfile(
                                  firstnameregcontroller.text,
                                  lastnameregcontroller.text,
                                  birthdateregcontroller.text,
                                  phoneregcontroller.text,
                                  Selectedgender,
                                  nationalityregcontroller,
                                  locationregcontroller.text,
                                  emailregcontroller.text,
                                  passcontroller.text,
                                  CertificateType,
                                  SocialStatus,
                                );
                                if (Error == null) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context)
                                      .pushReplacementNamed(Profile.id);
                                } else {
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(Error),
                                          ));
                                }
                                return null;
                              }
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
