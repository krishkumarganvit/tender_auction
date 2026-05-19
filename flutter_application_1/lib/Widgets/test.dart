import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/ProfileData.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Profiledata> myList = [
      Profiledata(
        title: "Full Name",
        value: "XYZ",
        icon: const Icon(Icons.person),
        isEaditable: true,
      ),
      Profiledata(
        title: "ACCOUNT",
        value: 1234,
        icon: const Icon(Icons.account_box_outlined),
      ),
      Profiledata(
        title: "BALANCE",
        value: 10000,
        icon: const Icon(Icons.money),
      ),
    ];

    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 255, 177, 177),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // PROFILE STACK
            Stack(
              children: [
                // Profile Image
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

                // Active Badge
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Active',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // Bottom Icon
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 137, 245, 43),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.account_box_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // PROFILE DATA LIST
            ...myList.map((data) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 137, 245, 43),
                    ),
                    color: const Color.fromARGB(255, 10, 250, 90),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      data.icon,
                      Text(' ${data.title} :'),
                      Text(' ${data.value}'),

                      const Spacer(),

                      if (data.isEaditable == true) const Icon(Icons.edit),
                    ],
                  ),
                ),
              );
            }),

            // BUTTON
            ElevatedButton.icon(
              onPressed: () {
                myList.add(
                  Profiledata(
                    title: "Full Name",
                    value: "XYZ",
                    icon: const Icon(Icons.person),
                    isEaditable: true,
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("ADD ROW"),
            ),
          ],
        ),
      ),
    );
  }
}

//
