import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GovAddPg.dart';
import 'AddPage.dart';
import 'EditPage.dart';

class GovernmentRequirement {
  int id;
  String title;
  String description;
  DateTime date;

  GovernmentRequirement({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}

Future<void> updateLocalStorage(
  List<GovernmentRequirement> requirementList,
) async {
  final prefs = await SharedPreferences.getInstance();

  List<Map<String, dynamic>> mapData = [];

  for (var e in requirementList) {
    mapData.add(e.toMap());
  }

  String jsonString = jsonEncode(mapData);

  await prefs.setString('gov_data', jsonString);
}

Future<List<GovernmentRequirement>> loadData() async {
  final prefs = await SharedPreferences.getInstance();

  String? jsonString = prefs.getString('gov_data');

  if (jsonString != null) {
    List<dynamic> jsonData = jsonDecode(jsonString);

    List<GovernmentRequirement> requirementList = [];

    for (var e in jsonData) {
      requirementList.add(
        GovernmentRequirement(
          id: e['id'],
          title: e['title'],
          description: e['description'],
          date: DateTime.parse(e['date']),
        ),
      );
    }

    return requirementList;
  }

  return [];
}

class FragmentHold extends StatefulWidget {
  const FragmentHold({super.key});

  @override
  State<FragmentHold> createState() {
    return FragmentHoldState();
  }
}

class FragmentHoldState extends State<FragmentHold> {
  List<GovernmentRequirement> requirementList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    requirementList = await loadData();

    if (requirementList.isEmpty) {
      requirementList = [
        GovernmentRequirement(
          id: 1,
          title: "Road Construction",
          description: "Need contractor for highway road work",
          date: DateTime(2026, 5, 20),
        ),

        GovernmentRequirement(
          id: 2,
          title: "Bridge Repair",
          description: "Repair work required for old bridge",
          date: DateTime(2026, 5, 21),
        ),

        GovernmentRequirement(
          id: 3,
          title: "School Building",
          description: "Government school construction project",
          date: DateTime(2026, 5, 22),
        ),

        GovernmentRequirement(
          id: 4,
          title: "Railway Station Renovation",
          description: "Modernization of railway station facilities",
          date: DateTime(2026, 5, 23),
        ),
      ];

      await updateLocalStorage(requirementList);
    }

    isLoading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Navigator(
              initialRoute: '/',

              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      builder: (context) => GovaddpgState(
                        requirement: requirementList,

                        onRefresh: () {
                          updateLocalStorage(requirementList);

                          setState(() {});
                        },
                      ),
                    );

                  case '/add':
                    return MaterialPageRoute(
                      builder: (context) => Addpage(
                        requirementList: requirementList,

                        onRefresh: () {
                          updateLocalStorage(requirementList);

                          setState(() {});
                        },
                      ),
                    );

                  case '/edit':
                    final args = settings.arguments as Map<String, dynamic>;

                    return MaterialPageRoute(
                      builder: (context) => EditPageState(
                        requirementList: requirementList,

                        index: args['index'],

                        onRefresh: () {
                          updateLocalStorage(requirementList);

                          setState(() {});
                        },
                      ),
                    );

                  default:
                    return MaterialPageRoute(
                      builder: (context) => const Scaffold(
                        body: Center(child: Text("Page Not Found")),
                      ),
                    );
                }
              },
            ),
    );
  }
}
