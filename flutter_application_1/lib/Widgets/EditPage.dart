import 'package:flutter/material.dart';
import 'fragmenthold.dart';

class EditPageState extends StatefulWidget {
  final List<dynamic> requirementList;
  final int index;

  const EditPageState({
    super.key,
    required this.requirementList,
    required this.index,
  });

  @override
  State<EditPageState> createState() => _EditPageStateState();
}

class _EditPageStateState extends State<EditPageState> {
  // Getters to make accessing the item easier
  GovernmentRequirement get item => widget.requirementList[widget.index];

  // Declare controllers
  late final TextEditingController idController;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers exactly once when the widget state is created
    idController = TextEditingController(text: item.id.toString());
    titleController = TextEditingController(text: item.title);
    descriptionController = TextEditingController(text: item.description);
    dateController = TextEditingController(text: item.date.toString());
  }

  @override
  void dispose() {
    // Clean up controllers to prevent memory leaks
    idController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Page"), centerTitle: true),
      body: SingleChildScrollView(
        // Added to handle keyboard overlapping the inputs
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: "ID"),
                keyboardType: TextInputType.number, // Better UX for numbers
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
                  // Save data back to your list item
                  item.id = int.tryParse(idController.text) ?? item.id;
                  item.title = titleController.text;
                  item.description = descriptionController.text;
                  item.date =
                      DateTime.tryParse(dateController.text) ?? item.date;

                  print(item.id);
                  Navigator.pop(
                    context,
                    true,
                  ); // Return true to signal a refresh might be needed
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
