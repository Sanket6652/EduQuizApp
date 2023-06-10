import 'dart:async';

import 'package:educlass/Model/question_model.dart';
import 'package:educlass/Widgets/countdown.dart';
import 'package:educlass/Widgets/preview_button.dart';
import 'package:educlass/screens/score_screen.dart';
import 'package:flutter/material.dart';
import '../Const/Constant.dart';
import '../Widgets/next_button.dart';
import '../Widgets/question_widget.dart';
import '../Widgets/option_card.dart';
import 'package:flutter/animation.dart';
import 'package:educlass/Widgets/option_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,  required String className}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final  _questions =const [
    {

      'question': 'Who is indias prime minister',
      'options': [
        {'answerText':'Modi','score': true},
        {'answerText':'sanket','score': false},
        {'answerText':'Gadkari','score': false},
        {'answerText':'gandhi','score': false}
      ],
    },
    {

      'question': 'Who is indias prime minister',
      'options': [
        {'answerText':'Modi','score': true},
        {'answerText':'sanket','score': false},
        {'answerText':'Gadkari','score': false},
        {'answerText':'gandhi','score': false}
      ],
    },
    {

      'question': 'Who is indias prime minister',
      'options': [
        {'answerText':'Modi','score': true},
        {'answerText':'sanket','score': false},
        {'answerText':'Gadkari','score': false},
        {'answerText':'gandhi','score': false}
      ],
    },
  ];

  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected=false;
  late AnimationController _controller;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      setState(() {
        index++;
        isPressed = true;
      });
    }
  }

  // ignore: non_constant_identifier_names
  void CheackAnswerAndUpdate(bool value) {
    if(isAlreadySelected){
      return;
    }else{
    if(value == true) {
      score++;
    }
      setState(() {
        isPressed = false;
        isAlreadySelected=true;
      });

    }
  }

  // @override
  // void dispose(){
  //   AnimationController;
  //   if(_controller.isAnimating || _controller.isCompleted) {
  //     _controller.dispose();
  //   }
  //   super.dispose();
  // }
  //
  // @override
  // void inistate(){
  //   AnimationController;
  //   super.initState();
  //   _controller=AnimationController(vsync: this,duration: Duration(seconds: limitTime));
  //   _controller.addListener(() {
  //     if(_controller.isCompleted){
  //       Navigator.pop(context);
  //       //Navigator.pushNamed(context, "/testResult");
  //     }
  //   });
  //   _controller.forward();
  // }

  // void initState(){
  //   super.initState();
  //   Timer(Duration(minutes: 1),(){
  //     setState(() {
  //       var greeting="Hello";
  //
  //     });
  //   });
  // }
  //
  // String Time="";
  // late Timer _timer;
  // @override
  // void initState(){
  //   super.initState();
  //   _timer=Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       Time="Time : ${DateTime.now().second}";
  //     });
  //   });
  // }

  List<Icon>_scoretraker=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: const Text('Quiz'),
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        actions: <Widget>[

          // CountDown(animation: StepTween(
          //    begin: limitTime,
          //   end: 0,
          //  ).animate(_controller)
          // ),

          // Text(Time,style: const TextStyle(fontSize: 20)),

          SizedBox( 
            width: 100,
            height: 10,
           
            child: FloatingActionButton(
              //textColor: Colors.white,
              highlightElevation: double.infinity,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>ScoreScreen(totalscore: score)));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Text("Submit"),
            ),
          ),

        ],
      ),

      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children:const <Widget> [
      //
      //       Column(
      //         children: [
      //
      //           ListTile(
      //             title: Text('0'),
      //           ),
      //           ListTile(
      //
      //             title: Text('1'),
      //           ),
      //           ListTile(
      //             title: Text('2'),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),


      body:  Center(
        child:Column(
          children: [
             Row(
              children: [
                if(_scoretraker.isEmpty)
                  const SizedBox(
                    height: 25,

                  ),
                if(_scoretraker.isNotEmpty) ..._scoretraker

              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.00, horizontal: 10.00),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    height: 100,
                    child: QuestionWidget(
                      question: _questions[index][_questions].toString(),
                      indexAction : index,
                      totalQuestion: _questions.length,
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 25.00,
                  ),

                  for (int i = 0; i < _questions[index].length; i++)
                    GestureDetector(
                      onTap: ()=>CheackAnswerAndUpdate(
                          _questions[index]['options'].toList()[i]),
                      child: Answer(
                        option: _questions[index].options.keys.toList()[i],
                        color: isPressed
                            ? _questions[index].options.values.toList()[i] == true
                            ? correct
                            : incorrect
                            : Colors.white10,


                      ),
                    )
                  // Card(
                  //   child: Text(_question[index].options.keys.toList()[i]),
                  // )

                ],
              ),
            )
          ],
        )
       ),
      // Container(
      //   width: double.infinity,
      //
      //   padding: const EdgeInsets.symmetric(vertical: 20.00, horizontal: 10.00),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         width: 400,
      //         height: 100,
      //         child: QuestionWidget(
      //             question: _question[index].title,
      //             indexAction: index,
      //             totalQuestion: _question.length,
      //         ),
      //       ),
      //       const Divider(
      //         color: Colors.black,
      //       ),
      //       const SizedBox(
      //         height: 25.00,
      //       ),
      //       for (int i = 0; i < _question[index].options.length; i++)
      //         GestureDetector(
      //           onTap: ()=>CheackAnswerAndUpdate(
      //             _question[index].options.values.toList()[i]),
      //           child: OptionCard(
      //             option: _question[index].options.keys.toList()[i],
      //             color: isPressed
      //                 ? _question[index].options.values.toList()[i] == true
      //                     ? correct
      //                     : incorrect
      //                 : Colors.white,
      //
      //           ),
      //         )
      //       // Card(
      //       //   child: Text(_question[index].options.keys.toList()[i]),
      //       // )
      //     ],
      //   ),
      // ),



      ///Bottom Buttons
      ///next, save, back , preview buttons
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [

          Positioned(
            bottom: 20.00,
            right: 80,
            child: SizedBox(
              height: 50,
              width: 90,
              child: FloatingActionButton(
                heroTag: 'save',
                onPressed: () {
                  if (index == _questions.length - 1) {
                    return;
                  } else {
                    if (isPressed) {
                      setState(() {
                        index++;
                        isPressed = true;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please select any option'),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                      ));
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("save"),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 80,
            child: SizedBox(
              height: 50,
              width: 90,
              child: FloatingActionButton(
                heroTag: 'preview',
                onPressed: () {
                  if (index == _questions.length + 1) {
                    return;
                  } else {
                    setState(() {
                      index--;
                      isPressed = false;
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("Preview"),
              ),
            ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
