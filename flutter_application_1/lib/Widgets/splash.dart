import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: double.infinity,

          color: const Color.fromARGB(255, 54, 71, 255),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const Text('Version 1.0')],
              ),
              const SizedBox(height: 100),
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
              const SizedBox(height: 125),

              Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                ],
              ),
              Center(
                child: const ProgressIndicatorTheme(
                  data: ProgressIndicatorThemeData(
                    color: Color.fromARGB(255, 137, 245, 43),
                  ),
                  child: Text('Loading...'),
                ),
              ),

              const SizedBox(height: 170),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [const Text('Copyright @2026....')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
