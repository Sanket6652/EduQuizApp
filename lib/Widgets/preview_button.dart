import 'package:flutter/material.dart';

class previewButton extends StatelessWidget {
  const previewButton({Key?key,required this.previewquestion}):super(key: key);

  final VoidCallback previewquestion;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,borderRadius: BorderRadius.circular(30.00),
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
