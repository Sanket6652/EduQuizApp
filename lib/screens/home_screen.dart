import 'package:educlass/Model/question_model.dart';
import 'package:educlass/Widgets/preview_button.dart';
import 'package:educlass/screens/score_screen.dart';
import 'package:flutter/material.dart';
import '../Const/Constant.dart';
import '../Widgets/next_button.dart';
import '../Widgets/question_widget.dart';
import '../Widgets/option_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,  required String className}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  final List<Question> _question = [
    Question(
      id: '1',
      title: 'Who is indias prime minister',
      options: {
        'Modi': true,
        'sanket': false,
        'Gadkari': false,
        'gandhi': false
      },
    ),
    Question(
      id: '2',
      title: 'Who is indias national bird',
      options: {
        'peacock': true,
        'owl': false,
        'catbird': false,
        'sparrow': false
      },
    )
  ];

  int index = 0;
  bool isPressed = false;
  int score = 0;

  void nextQuestion() {
    if (index == _question.length - 1) {
      return;
    } else {
      setState(() {
        index++;
        isPressed = false;
      });
    }
  }

  // ignore: non_constant_identifier_names
  void CheackAnswerAndUpdate(bool value) {
    if(value == true){
      score++;
     setState(() {
      isPressed = false;
    });
    }
  }

  void previewQustion() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        actions: <Widget>[
          
          SizedBox( 
            width: 100,
            height: 10,
           
            child: FloatingActionButton(
              //textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>ScoreScreen(totalscore: score)));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                
              ),
              child: const Text("Submit"),
            ),
          ),
        ],
      ),



      body: Container(
        width: double.infinity,
        
        padding: const EdgeInsets.symmetric(vertical: 20.00, horizontal: 10.00),
        child: Column(
          children: [
            QuestionWidget(
                question: _question[index].title,
                indexAction: index,
                totalQuestion: _question.length),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 25.00,
            ),
            for (int i = 0; i < _question[index].options.length; i++)
              GestureDetector(
                onTap: ()=>CheackAnswerAndUpdate(
                  _question[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _question[index].options.keys.toList()[i],
                  color: isPressed
                      ? _question[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : Colors.white,
                  
                ),
              )
            // Card(
            //   child: Text(_question[index].options.keys.toList()[i]),
            // )
          ],
        ),
      ),



      ///Bottom Buttons
      ///next, save, back , preview buttons
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          // Positioned(
          //   left: 30,
          //   bottom: 20,
          //   child: FloatingActionButton(
          //     heroTag: 'back',
          //     onPressed: () {
          //       if (index == _question.length + 1) {
          //         return;
          //       } else {
          //         setState(() {
          //           index--;
          //           isPressed = false;
          //         });
          //       }
          //     },
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: const Icon(
          //       Icons.arrow_left,
          //       size: 40,
          //     ),
          //     // child: const Text(
          //     //   "save,"
          //     // ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 20,
          //   right: 30,
          //   child: FloatingActionButton(
          //     heroTag: 'next',
          //     onPressed: () {
          //       if (index == _question.length - 1) {
          //         return;
          //       } else {
          //         if (isPressed) {
          //           setState(() {
          //             index++;
          //             isPressed = false;
          //           });
          //         } else {
          //           ScaffoldMessenger.of(context)
          //               .showSnackBar(const SnackBar(
          //                 content: Text('Please select any option'),
          //                 behavior:SnackBarBehavior.floating,
          //                 margin:EdgeInsets.symmetric(vertical: 20.0),
          //             ));
          //         }
          //       }
          //     },
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: const Icon(
          //       Icons.arrow_right,
          //       size: 40,
          //     ),
          //   ),
          // ),
          // Add more floating buttons if you want
          // There is no limit
          Positioned(
            bottom: 20.00,
            right: 80,
            child: SizedBox(
              height: 50,
              width: 90,
              child: FloatingActionButton(
                heroTag: 'save',
                onPressed: () {
                  if (index == _question.length - 1) {
                    return;
                  } else {
                    if (isPressed) {
                      setState(() {
                        index++;
                        isPressed = false;
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
                  if (index == _question.length + 1) {
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
