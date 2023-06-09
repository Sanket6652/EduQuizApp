import 'package:educlass/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../ClassScreen/classsdetailsScreen.dart';

class ClassListScreen extends StatelessWidget {
  final List<String> classes = [
    '10',
    '9',
    '8',
    '7',
    '6',
    '5',
    '4',
    '3',
    '2',
    '1',
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class List'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         ClassDetailsScreen(className: classes[index]),
                //   ),
                // );
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(className: classes[index]),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    classes[index],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 241, 239, 239),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}