import 'package:flutter/material.dart';
import 'fragmenthold.dart';

class AuctionPage extends StatelessWidget {
  final List<GovernmentRequirement> requirementList;

  const AuctionPage({super.key, required this.requirementList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF3F8),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A2980),
        title: const Text("Auction Page"),
      ),
      body: requirementList.isEmpty
          ? const Center(
              child: Text(
                "No Tender Available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: requirementList.length,
              itemBuilder: (context, index) {
                final item = requirementList[index];

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          item.description,
                          style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 18),
                            const SizedBox(width: 8),
                            Text(item.date.toString().split(" ")[0]),
                          ],
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1A2980),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Bid applied for ${item.title}",
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.gavel),
                            label: const Text("Place Bid"),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
