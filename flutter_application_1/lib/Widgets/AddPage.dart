import 'package:flutter/material.dart';

class GovernmentRequirement {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  const GovernmentRequirement({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });
}

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => AddpageState();
}

class AddpageState extends State<Addpage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Requirement")),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        color: Colors.white,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              color: const Color(0xFFBDBDBD),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _idController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Enter ID'),
                  ),

                  const SizedBox(height: 20),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Enter Title'),
                  ),

                  const SizedBox(height: 20),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Description',
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Date (yyyy-mm-dd)',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(onPressed: () {}, child: const Text("Add Data")),
          ],
        ),
      ),
    );
  }
}
