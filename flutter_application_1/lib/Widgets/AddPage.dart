import 'package:flutter/material.dart';
import 'fragmenthold.dart';

class Addpage extends StatefulWidget {
  final List<GovernmentRequirement> requirementList;

  const Addpage({super.key, required this.requirementList});

  @override
  State<Addpage> createState() => AddpageState();
}

class AddpageState extends State<Addpage> {
  final TextEditingController _idController = TextEditingController();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  void _addData() {
    final id = int.tryParse(_idController.text.trim());

    final title = _titleController.text.trim();

    final description = _descriptionController.text.trim();

    final dateText = _dateController.text.trim();

    if (id == null ||
        title.isEmpty ||
        description.isEmpty ||
        dateText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields correctly")),
      );
      return;
    }

    final date = DateTime.tryParse(dateText);

    if (date == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid date format")));
      return;
    }

    setState(() {
      widget.requirementList.add(
        GovernmentRequirement(
          id: id,
          title: title,
          description: description,
          date: date,
        ),
      );
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Requirement")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number,

              decoration: const InputDecoration(labelText: 'Enter ID'),
            ),

            TextField(
              controller: _titleController,

              decoration: const InputDecoration(labelText: 'Enter Title'),
            ),

            TextField(
              controller: _descriptionController,

              decoration: const InputDecoration(labelText: 'Enter Description'),
            ),

            TextField(
              controller: _dateController,

              decoration: const InputDecoration(
                labelText: 'Enter Date (yyyy-mm-dd)',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: _addData, child: const Text("Add Data")),
          ],
        ),
      ),
    );
  }
}
