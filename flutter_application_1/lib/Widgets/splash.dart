 Delete
import 'dart:async';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
=======
import 'package:flutter/material.dart';
import 'fragmenthold.dart';
main

class Splash extends StatelessWidget {
  const Splash({super.key});

Delete
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
=======
  void navi(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FragmentHold()),
    );
 main
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1A2980), Color(0xff26D0CE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Version 1.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
 Delete
=======
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4),
                        blurRadius: 25,
                        spreadRadius: 5,
                      ),
                    ],
 main
                    border: Border.all(color: Colors.white, width: 4),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://th.bing.com/th/id/OIP.v1NnyMI9TswAvh_L821ZpQHaHa?w=188&h=188&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Gov Tender Auction",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Loading your experience...",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                const SizedBox(height: 50),

 Delete
                const CircularProgressIndicator(color: Colors.white),

                const Spacer(),

                const Text(
                  "Redirecting to Login...",
                  style: TextStyle(color: Colors.white, fontSize: 16),
=======
                const SizedBox(
                  width: 45,
                  height: 45,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Colors.white24,
                  ),
                ),

                const Spacer(),

                Column(
                  children: const [
                    Text(
                      "Powered by Flutter",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "© 2026 All Rights Reserved",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
 main
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => navi(context),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xff1A2980),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    child: const Text(
                      'Go To Home',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
