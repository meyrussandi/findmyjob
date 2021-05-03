import 'package:findmyjob/ui/pages/home_page.dart';
import 'package:findmyjob/ui/pages/login_page.dart';
import 'package:findmyjob/ui/pages/onboarding_page.dart';
import 'package:findmyjob/ui/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => OnBoardingPage(),
        '/register' : (context) => RegisterPage(),
        '/login' : (context) => LoginPage(),
        '/home' : (context) => HomePage(),
      },
    );
  }
}
