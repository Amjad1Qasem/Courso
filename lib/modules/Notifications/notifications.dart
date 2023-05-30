import 'package:courso/shared/components/components.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  static String id = 'Notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF72A7EE),
        elevation: 0.2,
        title: const Text(
          'Notifications',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defText(
                text: 'لا يوجد اي اشعارات جديدة',
                size: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5))
          ],
        ),
      ),
    );
  }
}
