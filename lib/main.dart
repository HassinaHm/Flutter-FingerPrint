import 'package:fingerprint/auth.dart';
import 'package:fingerprint/authpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authentificationpage(),
    );
  }
}

class Authentificationpage extends StatefulWidget {
  const Authentificationpage({Key? key}) : super(key: key);

  @override
  State<Authentificationpage> createState() => _AuthentificationpageState();
}

class _AuthentificationpageState extends State<Authentificationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 88, 128),
      body: SafeArea(child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Login ", 
          style: TextStyle(color: Colors.white,
          fontSize: 38,
          fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 28,),
          Text("Welcome to the app", style: TextStyle(color: Colors.white70),),
          SizedBox(height: 28,),
          Divider(
            color: Colors.white60,
          ),
          SizedBox(height: 28,),
          ElevatedButton.icon(onPressed: () async{
            bool auth = await Authentication.authentication();
            print('can authenticate:  $auth');
            if(auth){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> secondPage()));
            }

          }, icon: Icon(Icons.fingerprint),
          label: Text('authenticate') ,)

        ],
      ),)),
    );
  }
}
