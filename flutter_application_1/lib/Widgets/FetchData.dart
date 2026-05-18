import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Api()));
}

class User {
  final String name;
  final int id;
  final String email;
  final String phone;

  const User({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
  });
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List<User> data = [];

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);

      setState(() {
        data = jsonData.map((json) {
          return User(
            name: json['name'],
            id: json['id'],
            email: json['email'],
            phone: json['phone'],
          );
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fetch Data Example"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 137, 245, 43),
                    width: 4,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://th.bing.com/th/id/OIP.v1NnyMI9TswAvh_L821ZpQHaHa?w=188&h=188&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: fetchData,
                child: const Text('Click Here to Fetch Data'),
              ),

              const SizedBox(height: 20),

              ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final User u = data[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${u.id}"),
                        Text("Name: ${u.name}"),
                        Text("Email: ${u.email}"),
                        Text("Phone: ${u.phone}"),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
