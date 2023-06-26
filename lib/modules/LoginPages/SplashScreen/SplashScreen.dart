// ignore_for_file: file_names, use_build_context_synchronously, duplicate_ignore, empty_statements

import 'package:courso/FireBase_Healper/FireBase_Healper.dart';
import 'package:courso/layout/Home_loayout/Home_layout.dart';
import 'package:courso/modules/LoginPages/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static String id = 'Splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    FirebaseHelper.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
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
            const SizedBox(
              height: 50,
            ),
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
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, top: 100),
                      child: GestureDetector(
                        onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final token = prefs.getString('token');
                          if (token != null) {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context)
                                .pushReplacementNamed(Home_Layout.id);
                          }
                          // ignore: use_build_context_synchronously
                          else {
                            Navigator.of(context)
                                .pushReplacementNamed(Login.id);
                          }
                          ;
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
