// ignore_for_file: file_names, unused_import

import 'package:courso/Profile/profilePage.dart';
import 'package:courso/layout/Home_loayout/Menu.dart';
import 'package:courso/modules/Category/category.dart';
import 'package:courso/modules/Home/home.dart';
import 'package:courso/modules/Notifications/notifications.dart';
import 'package:courso/modules/Search/Search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Layout extends StatefulWidget {
  const Home_Layout({super.key});
  static String id = 'Home_Layout';

  @override
  State<Home_Layout> createState() => _Home_LayoutState();
}

// ignore: camel_case_types
class _Home_LayoutState extends State<Home_Layout> {
  // ignore: non_constant_identifier_names
  int current_index = 0;
  List<Widget> screens = const [
    Menu(),
    Category(),
    Search(),
    Notifications(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f7ff),
      bottomNavigationBar: CurvedNavigationBar(
        index: current_index,
        onTap: (index) {
          setState(() {
            current_index = index;
            // ignore: avoid_print
            print(current_index);
          });
        },
        // ignore: prefer_const_constructors
        animationDuration: Duration(milliseconds: 150),
        backgroundColor: const Color(0xfff2f7ff),
        color: const Color.fromARGB(255, 18, 106, 221),
        height: 65,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.category,
            color: Colors.white,
            size: 30,
          ),
           Icon(
            Icons.search_rounded,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.notification_important,
            color: Colors.white,
            size: 30,
          ),
          Icon(Icons.person, color: Colors.white,size: 30,),
        ],
      ),
      body: screens[current_index],
    );
  }
}
