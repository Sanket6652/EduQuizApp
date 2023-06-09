import 'package:educlass/Model/question_model.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key,required this.nextquestion}):super(key:key);

  final VoidCallback nextquestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextquestion,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(30.0)
          ),

        padding: const EdgeInsets.symmetric(vertical: 10.00),
        margin: const EdgeInsets.all(8.0),
        child: const Text(
          'Save & Next',
          textAlign: TextAlign.center,
        ),

      ),

    );
    
  }
}
