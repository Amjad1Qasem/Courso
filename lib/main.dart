// ignore: unused_import
// import 'package:courso/modules/LoginPages/SignIn/Login2.dart';
// import 'package:courso/modules/LoginPages/SignUp/Login.dart';
// ignore_for_file: unused_import, duplicate_ignore
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:courso/Profile/Setting.dart';
import 'package:courso/Profile/profilePage.dart';
import 'package:courso/modules/Category/categoryCourses.dart';
import 'package:courso/modules/Cours%20Details/CoursDetails.dart';
import 'package:courso/modules/Cours%20Details/DoneRegistr.dart';
import 'package:courso/modules/Cours%20Details/RegistrationForm.dart';
import 'package:courso/modules/Courses/allCourses.dart';
import 'package:courso/layout/Home_loayout/Home_layout.dart';
import 'package:courso/modules/Category/category.dart';
import 'package:courso/modules/Home/drawerScreen.dart';
import 'package:courso/modules/Home/home.dart';
import 'package:courso/modules/Instuites/InstuitPage.dart';
import 'package:courso/modules/Instuites/instuites.dart';
import 'package:courso/modules/LoginPages/Login/Login.dart';
import 'package:courso/modules/LoginPages/SplashScreen/SplashScreen.dart';
import 'package:courso/modules/Notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'modules/LoginPages/Register/Register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      supportedLocales: const [
        //Locale('en'),
       Locale('ar'),
      ],
      locale: const Locale('ar'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      // initialRoute: Splash.id,
      home: const  Splash(),
      routes: {
        Splash.id: (context) => const Splash(),
        Register.id: (context) => const Register(),
        Login.id: (context) => const Login(),
        Home_Layout.id: (context) => const Home_Layout(),
        Notifications.id: (context) => const Notifications(),
        drawerScreen.id: (context) => const drawerScreen(),
        Home.id: (context) => const Home(),
        Instuites.id: (context) => Instuites(),
        Details.id: (context) => const Details(CoursId: 1,),
        //registrationForm.id: (context) => const registrationForm(),
        Done.id: (context) => const Done(),
        InstuitPage.id: (context) => const  InstuitPage(insttuitId: 1,),
        Profile.id: (context) => const Profile(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const Setting()),
      //home: Splash(),
    );
  }
}
