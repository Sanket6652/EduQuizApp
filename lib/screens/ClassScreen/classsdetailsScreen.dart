import 'package:flutter/material.dart';



class ClassDetailsScreen extends StatelessWidget {
  final String className;

  const ClassDetailsScreen({required this.className});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Details'),
      ),
      body: Center(
        child: Text(
          'Class: $className',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}