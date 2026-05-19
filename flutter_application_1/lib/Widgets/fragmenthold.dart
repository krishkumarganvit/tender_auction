import 'package:flutter/material.dart';
import 'govaddpg.dart';
import 'EditPage.dart';
import 'splash.dart';

class FragmentHold extends StatefulWidget {
  const FragmentHold({super.key});

  @override
  State<FragmentHold> createState() => FragmentHoldState();
}

class FragmentHoldState extends State<FragmentHold> {
  var data = [];

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
                      builder: (context) => const Govaddpg(),
                    );

                  case '/edit':
                    final args = settings.arguments as Map<String, dynamic>;
                    return MaterialPageRoute(
                      builder: (context) => EditPage(
                        id: args['id'],
                        title: args['title'],
                        description: args['description'],
                        // date: args['date'],
                      ),
                    );

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
