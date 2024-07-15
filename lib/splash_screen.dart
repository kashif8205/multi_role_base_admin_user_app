import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_base_admin_user_app/home_screen.dart';
import 'package:multi_role_base_admin_user_app/login_screen.dart';
import 'package:multi_role_base_admin_user_app/student_screen.dart';
import 'package:multi_role_base_admin_user_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';
    if (isLogin) {
    
    if(userType == 'student'){

      Timer(const Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StudentScreen()));
      });
    }else if(userType == 'teacher'){
       Timer(const Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TeacherScreen()));
      });
    }else{
      Timer(const Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
    }


    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://images.pexels.com/photos/1187079/pexels-photo-1187079.jpeg?auto=compress&cs=tinysrgb&w=800')),
    );
  }
}
