import 'package:flutter/material.dart';
import 'package:multi_role_base_admin_user_app/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text(
          'Sign up',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(hintText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString('Email', emailController.text.toString());
              sp.setString('Age', ageController.text.toString());
              // admin, student, teacher
              sp.setString('userType', 'teacher');
              sp.setBool('isLogin', true);
              if(sp.getString('userType') == 'teacher'){
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
              }else if(sp.getString('userType') == 'student'){
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
              }
              


              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: const Center(child: Text('Sign up')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
