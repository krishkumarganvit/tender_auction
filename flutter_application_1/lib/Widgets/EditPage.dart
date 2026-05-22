// EditPage.dart

import 'package:flutter/material.dart';

import 'fragmenthold.dart';

class EditPageState extends StatefulWidget {
  final List<GovernmentRequirement> requirementList;

  final int index;

  final Function() onRefresh;

  const EditPageState({
    super.key,
    required this.requirementList,
    required this.index,
    required this.onRefresh,
  });

  @override
  State<EditPageState> createState() => _EditPageStateState();
}

class _EditPageStateState extends State<EditPageState> {
  late TextEditingController idController;

  late TextEditingController titleController;

  late TextEditingController descriptionController;

  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();

    final item = widget.requirementList[widget.index];

    idController = TextEditingController(text: item.id.toString());

    titleController = TextEditingController(text: item.title);

    descriptionController = TextEditingController(text: item.description);

    dateController = TextEditingController(
      text: item.date.toString().split(' ')[0],
    );
  }

  void saveData() {
    final item = widget.requirementList[widget.index];

    item.id = int.tryParse(idController.text) ?? item.id;

    item.title = titleController.text;

    item.description = descriptionController.text;

    item.date = DateTime.tryParse(dateController.text) ?? item.date;

    widget.onRefresh();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Page")),

      body: Padding(
        padding: const EdgeInsets.all(20),

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

              decoration: const InputDecoration(labelText: "yyyy-mm-dd"),
            ),

            const SizedBox(height: 25),

            ElevatedButton(onPressed: saveData, child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
