// ignore_for_file: file_names

import 'package:courso/modules/Home/drawerScreen.dart';
import 'package:courso/modules/Home/home.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          drawerScreen(),
          Home(),
        ],
      ),
    );
  }
}
