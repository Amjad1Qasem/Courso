// ignore_for_file: camel_case_types, file_names, avoid_print, duplicate_ignore, non_constant_identifier_names

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:courso/modules/Cours%20Details/DoneRegistr.dart';
import 'package:courso/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

var firstnameregcontroller = TextEditingController();
var lastnameregcontroller = TextEditingController();
var phoneregcontroller = TextEditingController();
var locationregcontroller = TextEditingController();
var birthdateregcontroller = TextEditingController();
var emailregcontroller = TextEditingController();
var nationalityregcontroller = TextEditingController();

GlobalKey<FormState> formkey = GlobalKey<FormState>();
GlobalKey checkboxkey = GlobalKey();

String Selectedgender = 'ذكر';
String SocialStatus = 'لا أعمل';
String CertificateType = 'المرحلة الابتدائية';
bool ischacked = false;

class registrationForm extends StatefulWidget {
  const registrationForm({super.key});
  static String id = 'registrationForm';

  @override
  State<registrationForm> createState() => _registrationFormState();
}

class _registrationFormState extends State<registrationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF2F7FF),
      appBar: AppBar(
        centerTitle: true,
        title: defText(
            text: 'استمارة التسجيل',
            size: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white),
        backgroundColor: const Color(0xff72a7ee),
        elevation: 0.2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                          image: AssetImage('assets/images/NotIma.png')),
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
                              RequiredValidator(errorText: 'حقل الاسم اجباري'),
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
                              RequiredValidator(errorText: 'حقل الكنية اجباري'),
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
                                  text: 'تاريخ الميلاد :',
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
                          GestureDetector(
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
                            child: const Text('اختر تاريخ'),
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
                              // MinLengthValidator(8,
                              //     errorText:
                              //         'first name must be at least 8 digits long'),

                              // PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'first name must have at least one special character')
                            ]),
                            radius: 10,
                            controller: phoneregcontroller,
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
                            controller: emailregcontroller,
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
                  height: 18,
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
                const SizedBox(
                  height: 18,
                ),
                ListTile(
                    title: defText(
                        text: ' هل سجلت مسبقاً بإحدى دوراتنا!',
                        size: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    leading: Checkbox(
                      key: checkboxkey,
                      value: ischacked,
                      onChanged: (bool? val) => setState(() {
                        ischacked = val!;
                      }),
                    )),
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print('object');
                    },
                    child: defaultButton(
                      width: 150,
                      text: 'تأكيد',
                      function: () {
                        if (Form.of(context).validate()) {
                          Form.of(context).save();
                          print(firstnameregcontroller.text);
                          print(lastnameregcontroller.text);
                          print(phoneregcontroller.text);
                          print(locationregcontroller.text);
                          print(birthdateregcontroller.text);
                          print(emailregcontroller.text);
                          print(nationalityregcontroller.text);
                          Navigator.of(context).pushReplacementNamed(Done.id);
                          firstnameregcontroller.clear();
                          lastnameregcontroller.clear();
                          phoneregcontroller.clear();
                          locationregcontroller.clear();
                          birthdateregcontroller.clear();
                          emailregcontroller.clear();
                          nationalityregcontroller.clear();
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
    );
  }
}

void opinDatePicker(BuildContext context) {
  BottomPicker.date(
    title: 'اختيار تاريخ ميلادك',
    dateOrder: DatePickerDateOrder.ymd,
    pickerTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.blue,
    ),
    onChange: (index) {
      print(index);
    },
    onSubmit: (index) {
      print(index);
    },
    bottomPickerTheme: BottomPickerTheme.plumPlate,
  ).show(context);
}
