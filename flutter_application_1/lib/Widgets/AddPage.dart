import 'package:flutter/material.dart';

import 'fragmenthold.dart';

class Addpage extends StatefulWidget {
  final List<GovernmentRequirement> requirementList;

  final Function() onRefresh;

  const Addpage({
    super.key,
    required this.requirementList,
    required this.onRefresh,
  });

  @override
  State<Addpage> createState() => AddpageState();
}

class AddpageState extends State<Addpage> {
  final TextEditingController idController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  void addData() {
    final id = int.tryParse(idController.text);

    if (id == null) {
      return;
    }

    widget.requirementList.add(
      GovernmentRequirement(
        id: id,

        title: titleController.text,

        description: descriptionController.text,

        date: DateTime.tryParse(dateController.text) ?? DateTime.now(),
      ),
    );

    widget.onRefresh();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Page")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: idController,

              decoration: const InputDecoration(labelText: "Enter ID"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: titleController,

              decoration: const InputDecoration(labelText: "Enter Title"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,

              decoration: const InputDecoration(labelText: "Enter Description"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: dateController,

              decoration: const InputDecoration(labelText: "yyyy-mm-dd"),
            ),

            const SizedBox(height: 25),

            ElevatedButton(onPressed: addData, child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}
