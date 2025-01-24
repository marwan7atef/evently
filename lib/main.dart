import 'package:evently/app_theam.dart';
import 'package:evently/auth/login_Screen.dart';
import 'package:flutter/material.dart';

import 'Home/home_screen.dart';
import 'auth/register_screen.dart';

void main() {
  runApp(EventlyApp());
}
class EventlyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        LoginScreen.routeName:(_)=>LoginScreen(),
        RegisterScreen.routeName:(_)=>RegisterScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
      } ,
      initialRoute:HomeScreen.routeName,
      themeMode: ThemeMode.light,
      theme: AppThem.lightMode,
      darkTheme: AppThem.darkMode,

    );
  }
}

