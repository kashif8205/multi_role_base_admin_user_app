import 'package:flutter/material.dart';
import 'package:multi_role_base_admin_user_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

String email = 'email', age = 'Age';

 @override
  void initState(){
    super.initState();
    loadData();
 }
 loadData()async{
  SharedPreferences sp =await SharedPreferences.getInstance();
  email = sp.getString('Email')?? '';
  age = sp.getString('Age')?? '';
  setState(() {
    
  });
 }

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child:  Text('Home')),
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