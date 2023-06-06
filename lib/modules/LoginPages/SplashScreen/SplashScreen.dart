// ignore_for_file: file_names

import 'package:courso/modules/LoginPages/Login/Login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static String id = 'Splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                  width: 240,
                  height: 240,
                  image: AssetImage('assets/images/intro.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Courso',
                    style: TextStyle(fontFamily: 'Acme', fontSize: 70),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Text(
                      ' انضم إلينا و اعثر على دوراتك المفضلة ..',
                      style: TextStyle(fontFamily: 'cairo', fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const Image(
                          fit: BoxFit.cover,
                          width: 240,
                          height: 235,
                          image: AssetImage('assets/images/shapintro2.png')),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 20, top: 100),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Login.id);
                        },
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                            child: const Icon(
                          Icons.arrow_forward,
                          size: 80,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
