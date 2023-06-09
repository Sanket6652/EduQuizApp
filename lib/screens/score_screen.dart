import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatelessWidget {
   ScoreScreen({Key? key, required this.totalscore}) : super(key: key);

  var totalscore;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Score"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Score : $totalscore",style: const TextStyle(fontSize: 34,color:Colors.blue ),)
              ],
            )
          ),
         
      ),
    )
    );
  }
}
