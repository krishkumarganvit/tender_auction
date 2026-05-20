import 'package:flutter/material.dart';

class EditPageState extends StatelessWidget {
  final Map<String, dynamic> data;

  EditPageState({super.key, required this.data});

  late final TextEditingController idController = TextEditingController(
    text: data['id'].toString(),
  );

  late final TextEditingController titleController = TextEditingController(
    text: data['title'],
  );

  late final TextEditingController descriptionController =
      TextEditingController(text: data['description']);
  late final TextEditingController dateController = TextEditingController(
    text: data['date'].toString(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Page"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: idController,

              decoration: const InputDecoration(labelText: "ID"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: titleController,

              decoration: const InputDecoration(labelText: "Title"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: descriptionController,

              decoration: const InputDecoration(labelText: "Description"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: dateController,

              decoration: const InputDecoration(labelText: "Date"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                data['id'] = int.parse(idController.text);

                data['title'] = titleController.text;

                data['description'] = descriptionController.text;

                data['date'] = DateTime.parse(dateController.text);

                Navigator.pop(context);
              },

              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
