// ignore_for_file: file_names, unused_import

import 'package:courso/controllers/coursController.dart';
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
var locationregcontroller = TextEditingController();
var nationalityregcontroller = TextEditingController();
var birthdateregcontroller = TextEditingController();
//var formkey = GlobalKey<FormState>();
bool secure = true;
GlobalKey<FormState> formkey = GlobalKey<FormState>();
GlobalKey checkboxkey = GlobalKey();
String Selectedgender = 'ذكر';
String SocialStatus = 'لا أعمل';
String CertificateType = 'المرحلة الابتدائية';
bool ischacked = false;

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
        body:
            //  Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Center(
            //     child: SingleChildScrollView(
            //       child: Form(
            //         key: formkey,
            //         child: Column(
            //           children: [
            //             const Image(
            //               image: AssetImage('assets/images/Hello-pana.png'),
            //               width: 200,
            //               height: 200,
            //             ),
            //             defaultTextFormField(
            //               hintText: ' ',
            //               sufixfun: () {
            //                 setState(() {});
            //                 return null;
            //               },
            //               validator: MultiValidator([
            //                 RequiredValidator(
            //                     errorText: 'first name must not be empty'),
            //                 // MinLengthValidator(8,
            //                 //     errorText:
            //                 //         'first name must be at least 8 digits long'),

            //                 // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
            //               ]),
            //               radius: 15,
            //               controller: firstnamecontroller,
            //               keyboard: TextInputType.name,
            //               labText: 'الاسم ',
            //               prifix: Icons.person,
            //             ),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             defaultTextFormField(
            //               hintText: ' ',
            //               sufixfun: () {
            //                 setState(() {});
            //                 return null;
            //               },
            //               validator: MultiValidator([
            //                 RequiredValidator(
            //                     errorText: 'last name must not be empty'),
            //                 // MinLengthValidator(8,
            //                 //     errorText:
            //                 //         'last name must be at least 8 digits long'),

            //                 // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'last name must have at least one special character')
            //               ]),
            //               radius: 15,
            //               controller: lastnamecontroller,
            //               keyboard: TextInputType.emailAddress,
            //               labText: 'الكنية',
            //               prifix: Icons.person,
            //             ),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             defaultTextFormField(
            //               hintText: ' ',
            //               sufixfun: () {
            //                 setState(() {});
            //                 return null;
            //               },
            //               validator: MultiValidator([
            //                 RequiredValidator(
            //                     errorText: ' phone must not be empty'),
            //                 MinLengthValidator(10,
            //                     errorText: 'phone must be at least 10 digits long'),
            //                 // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'phone must have at least one special character')
            //               ]),
            //               radius: 15,
            //               controller: phonecontroller,
            //               keyboard: TextInputType.number,
            //               labText: 'الهاتف',
            //               prifix: Icons.phone_android,
            //             ),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             defaultTextFormField(
            //               hintText: ' ',
            //               sufixfun: () {
            //                 setState(() {});
            //                 return null;
            //               },
            //               validator: MultiValidator([
            //                 RequiredValidator(
            //                     errorText: ' email must not be empty'),
            //                 MinLengthValidator(8,
            //                     errorText: 'email must be at least 8 digits long'),
            //                 // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'email must have at least one special character')
            //               ]),
            //               radius: 15,
            //               controller: emailcontroller,
            //               keyboard: TextInputType.emailAddress,
            //               labText: 'الايميل',
            //               prifix: Icons.email,
            //             ),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             defaultTextFormField(
            //               hintText: ' ',
            //               validator: MultiValidator([
            //                 RequiredValidator(
            //                     errorText: 'password must not be empty'),
            //                 MinLengthValidator(8,
            //                     errorText:
            //                         'password must be at least 8 digits long'),
            //                 // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
            //               ]),
            //               controller: passcontroller,
            //               keyboard: TextInputType.visiblePassword,
            //               labText: 'كلمة المرور',
            //               radius: 15,
            //               prifix: Icons.lock,
            //               sufix: secure ? Icons.visibility : Icons.visibility_off,
            //               sufixfun: () {
            //                 setState(() {
            //                   secure = !secure;
            //                 });
            //                 return null;
            //               },
            //               securTrue: secure,
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Builder(builder: (context) {
            //               return GestureDetector(
            //                 onTap: () {
            //                   // ignore: avoid_print
            //                   print('object');
            //                 },
            //                 child: defaultButton(
            //                   width: 242,
            //                   text: 'إنشاء حساب',
            //                   function: () {
            //                     if (Form.of(context).validate()) {
            //                       Form.of(context).save();
            //                       // ignore: avoid_print
            //                       print(firstnamecontroller.text);
            //                       // ignore: avoid_print
            //                       print(lastnamecontroller.text);
            //                       // ignore: avoid_print
            //                       print(phonecontroller.text);
            //                       // ignore: avoid_print
            //                       print(emailcontroller.text);
            //                       // ignore: avoid_print
            //                       print(passcontroller.text);
            //                       Navigator.of(context).pushReplacementNamed(Home_Layout.id);
            //                     }
            //                     return null;
            //                   },
            //                 ),
            //               );
            //             }),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 const Text(
            //                   'هل تملك حساب مسبقاً ?',
            //                   textDirection: TextDirection.rtl,
            //                   style: TextStyle(
            //                     fontFamily: 'cairo',
            //                     fontSize: 14,
            //                   ),
            //                 ),
            //                 TextButton(
            //                   onPressed: () {
            //                     firstnamecontroller.clear();
            //                     lastnamecontroller.clear();
            //                     phonecontroller.clear();
            //                     emailcontroller.clear();
            //                     passcontroller.clear();
            //                     Navigator.of(context)
            //                         .pushReplacementNamed(Login.id);
            //                   },
            //                   child: const Text(
            //                     'تسجيل الدخول',
            //                     textDirection: TextDirection.ltr,
            //                     style: TextStyle(
            //                       color: Colors.red,
            //                       fontFamily: 'cairo',
            //                       fontSize: 14,
            //                     ),
            //                   ),
            //                 ),

            //               ],
            //             ),
            //             Container(
            //               width: 250,
            //               height: 1,
            //               color: const Color(0xff333333).withOpacity(0.3),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(
                        child: Image(
                          image: AssetImage('assets/images/Hello-pana.png'),
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
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
                                RequiredValidator(
                                    errorText: 'حقل الاسم اجباري'),
                                // MinLengthValidator(8,
                                //     errorText:
                                //         'first name must be at least 8 digits long'),

                                // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                              ]),
                              radius: 10,
                              controller: firstnamecontroller,
                              keyboard: TextInputType.name,
                              labText: ' ',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
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
                                RequiredValidator(
                                    errorText: 'حقل الكنية اجباري'),
                                // MinLengthValidator(8,
                                //     errorText:
                                //         'first name must be at least 8 digits long'),

                                // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                              ]),
                              radius: 10,
                              controller: lastnamecontroller,
                              keyboard: TextInputType.name,
                              labText: ' ',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    sufixfun: () {},
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText:
                                              'حقل تاريخ الميلاد اجباري'),
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
                                    padding:
                                        const EdgeInsets.only(top: 8, right: 5),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final DateTime? dateTime =
                                            await showDatePicker(
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
                                      child: const Icon(Icons.date_range),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
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
                                  errorText: 'حقل رقم الهاتف اجباري',
                                ),
                                MinLengthValidator(10,
                                    errorText:
                                        'first name must be at least 10 digits long'),

                                // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                              ]),
                              radius: 10,
                              controller: phonecontroller,
                              keyboard: TextInputType.phone,
                              labText: ' ',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                defText(
                                    text: 'الجنس :',
                                    size: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsetsDirectional.only(
                                  end: 6, start: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xff333333),
                                  width: 1,
                                ),
                                color: const Color(0xffcfd9f0),
                              ),
                              child: DropdownButton(
                                iconSize: 30,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    // ignore: sort_child_properties_last
                                    child: defText(
                                        text: 'ذكر',
                                        size: 18,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xf3333333)),
                                    value: 'ذكر',
                                  ),
                                  DropdownMenuItem(
                                    // ignore: sort_child_properties_last
                                    child: defText(
                                        text: 'انثى',
                                        size: 18,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xf3333333)),
                                    value: 'انثى',
                                  ),
                                ],
                                onChanged: (String? val) {
                                  setState(() {
                                    Selectedgender = val!;
                                  });
                                },
                                value: Selectedgender,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
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
                              controller: emailcontroller,
                              keyboard: TextInputType.name,
                              labText: ' ',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
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
                              hintText: 'example@gmail.com',
                              sufixfun: () {
                                return null;
                              },
                              validator: MultiValidator([]),
                              radius: 10,
                              controller: passcontroller,
                              keyboard: TextInputType.name,
                              labText: ' ',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defText(
                                    text: 'الجنسية :',
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
                              validator: MultiValidator([]),
                              radius: 10,
                              controller: nationalityregcontroller,
                              keyboard: TextInputType.name,
                              labText: ' ',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
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
                              validator: MultiValidator([]),
                              radius: 10,
                              controller: locationregcontroller,
                              keyboard: TextInputType.name,
                              labText: ' ',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
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
                              padding: const EdgeInsetsDirectional.only(
                                  end: 6, start: 6),
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
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
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
                              padding: const EdgeInsetsDirectional.only(
                                  end: 6, start: 6),
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
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
                        function: () async {
                          if (Form.of(context).validate()) {
                            Form.of(context).save();
                            // ignore: avoid_print, non_constant_identifier_names
                            final Error =
                                await RegisterController.getNewRegister(
                              firstnamecontroller.text,
                              lastnamecontroller.text,
                              birthdateregcontroller.text,
                              phonecontroller.text,
                              Selectedgender,
                              nationalityregcontroller.text,
                              locationregcontroller.text,
                              emailcontroller.text,
                              passcontroller.text,
                              CertificateType,
                              SocialStatus,
                            );
                            if (Error == null) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context)
                                  .pushReplacementNamed(Home_Layout.id);
                            } else {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(Error),
                                      ));
                            }
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
                          Navigator.of(context).pushReplacementNamed(Login.id);
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
    );
  }
}
