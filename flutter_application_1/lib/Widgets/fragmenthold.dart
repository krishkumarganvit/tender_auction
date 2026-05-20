import 'package:flutter/material.dart';
import 'govaddpg.dart';
import 'EditPage.dart';
import 'AddPage.dart';

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

class FragmentHold extends StatefulWidget {
  const FragmentHold({super.key});

  @override
  State<FragmentHold> createState() => FragmentHoldState();
}

class FragmentHoldState extends State<FragmentHold> {
  List<GovernmentRequirement> requirementList = [
    GovernmentRequirement(
      id: 1,
      title: "Road Construction",
      description: "Need contractor for highway road work",
      date: DateTime.now(),
    ),

    GovernmentRequirement(
      id: 2,
      title: "Bridge Repair",
      description: "Repair work required for old bridge",
      date: DateTime.now(),
    ),

    GovernmentRequirement(
      id: 3,
      title: "School Building",
      description: "Government school construction project",
      date: DateTime(2024, 6, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              initialRoute: '/',
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                      builder: (context) =>
                          Govaddpg(requirement: requirementList),
                    );

                  case '/edit':
                    final args = settings.arguments as Map<String, dynamic>;
                    return MaterialPageRoute(
                      builder: (context) => EditPage(
                        id: args['id'],
                        title: args['title'],
                        description: args['description'],
                        date: args['date'],
                      ),
                    );
                  case '/add':
                    return MaterialPageRoute(builder: (context) => Addpage());

                  default:
                    return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
