import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: EditPage(
//         id: 1,
//         title: 'title',
//         description: 'description',
//         // date: DateTime.now(),
//       ),
//     ),
//   );
// }

class EditPage extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final DateTime date;

  const EditPage({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController idController;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();

    idController = TextEditingController(text: widget.id.toString());

    titleController = TextEditingController(text: widget.title);

    descriptionController = TextEditingController(text: widget.description);

    dateController = TextEditingController(text: widget.date.toString());
  }

  @override
  void dispose() {
    idController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Widget customField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Page"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 43, 68, 208),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            customField("Enter the new ID", idController),

            customField("Enter the new title", titleController),

            customField("Enter the new description", descriptionController),

            customField("Enter the new date", dateController),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print(idController.text);
                print(titleController.text);
                print(descriptionController.text);
                print(dateController.text);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
