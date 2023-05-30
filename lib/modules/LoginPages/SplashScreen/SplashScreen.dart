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
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 180),
              child: Center(
                child: Image(
                    width: 280,
                    height: 200,
                    image: AssetImage('assets/images/intro.png')),
              ),
            ),
            const SizedBox(
              height: 30,
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: const Image(
                            fit: BoxFit.cover,
                            width: 250,
                            height: 245,
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
                            size: 90,
                            color: Colors.white,
                          )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
