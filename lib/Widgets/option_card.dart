import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String option;

  Answer({ required this.option, required this.color}) {
    // TODO: implement Answer
    throw UnimplementedError();
  }
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22.00,
          ),
        ),
      ),
    );

    // return InkWell(
    //   onTap: (){},
    //   child: Container(
    //     padding: EdgeInsets.all(15),
    //     margin: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       color: null,
    //       border: Border.all(color: Colors.blue),
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     child: Text(
    //       'Answer',
    //       style: TextStyle(
    //         fontSize: 20,
    //       ),
    //     ),
    //   ),
    // );
  }
}
