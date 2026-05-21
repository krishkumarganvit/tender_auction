import 'package:flutter/material.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',

        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) =>
                    GovaddpgState(requirement: requirementList),
              );

            case '/add':
              return MaterialPageRoute(
                builder: (context) => Addpage(
                  requirementList: requirementList,

                  onRefresh: () {
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
                    setState(() {});
                  },
                ),
              );

            default:
              return MaterialPageRoute(
                builder: (context) =>
                    const Scaffold(body: Center(child: Text("Page Not Found"))),
              );
          }
        },
      ),
    );
  }
}
