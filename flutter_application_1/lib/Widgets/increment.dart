import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Increment()));
}

class Increment extends StatefulWidget {
  const Increment({super.key});

  @override
  State<Increment> createState() => _IncrementState();
}

class _IncrementState extends State<Increment> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count : $count"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
