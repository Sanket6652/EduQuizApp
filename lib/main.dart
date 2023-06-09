import 'dart:async';

import 'package:educlass/splashscreen/SplashScree.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/ClassScreen/class_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spash Screen",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen() ,
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   @override
 
//   _SplashScreenState createState() {
//     return _SplashScreenState();
//   }
// }
// class _SplashScreenState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3),
//           ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => HomeScreen()));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("This is the splash screen")
//     );
//   }
// }






