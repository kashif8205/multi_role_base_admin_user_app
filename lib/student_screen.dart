import 'package:flutter/material.dart';
import 'package:multi_role_base_admin_user_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  
String email = 'email', age = 'Age', type = '';

 @override
  void initState(){
    super.initState();
    loadData();
 }
 loadData()async{
  SharedPreferences sp =await SharedPreferences.getInstance();
  email = sp.getString('Email')?? '';
  age = sp.getString('Age')?? '';
  type = sp.getString('userType')!;
  setState(() {
    
  });
 }

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child:  Text('Student View')),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Text('Email'),
            Text(email.toString()),

          ],
         ),
        const SizedBox(height: 10,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Text('Age'),
            Text(age.toString()),

          ],
         ),
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Text('user Type'),
            Text(type.toString()),

          ],
         ),
           const   SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async{
                SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        
        
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: const Center(child: Text('Logout')),
                ),
              )
          ],
        ),
      ),
    );
  }
}