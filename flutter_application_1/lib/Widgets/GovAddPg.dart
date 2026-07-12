import 'package:flutter/material.dart';

class GovaddpgState extends StatefulWidget {
  final List<dynamic> requirement;
  final Function() onRefresh;

  const GovaddpgState({
    super.key,
    required this.requirement,
    required this.onRefresh,
  });

  @override
  State<GovaddpgState> createState() => _GovaddpgStateState();
}

class _GovaddpgStateState extends State<GovaddpgState> {
  String selectedFilter = "All";

  List<dynamic> get filteredList {
    if (selectedFilter == "All") {
      return widget.requirement;
    }

    return widget.requirement.where((item) {
      String itemDate = item.date.toString().split(' ')[0];
      return itemDate == selectedFilter;
    }).toList();
  }

  void showBidDialog(dynamic item) {
    TextEditingController bidController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Current Highest Bid",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(
                "₹${item.highestBid.toStringAsFixed(0)}",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: bidController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Your Bid",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                double bid = double.tryParse(bidController.text) ?? 0;

                if (bid <= item.highestBid) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Bid must be greater than current highest bid.",
                      ),
                    ),
                  );
                  return;
                }

                setState(() {
                  item.highestBid = bid;
                });

                widget.onRefresh();

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Bid of ₹${bid.toStringAsFixed(0)} placed successfully!",
                    ),
                  ),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF3F8),

      appBar: AppBar(
        backgroundColor: const Color(0xff1A2980),
        title: const Text("Government Tender"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A2980),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Filter : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedFilter,
                    items:
                        [
                          "All",
                          ...widget.requirement
                              .map((e) => e.date.toString().split(' ')[0])
                              .toSet()
                              .toList(),
                        ].map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final item = filteredList[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    elevation: 5,
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

                          const SizedBox(height: 10),

                          Text(
                            "Highest Bid : ₹${item.highestBid.toStringAsFixed(0)}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/edit',
                                    arguments: {
                                      'index': widget.requirement.indexOf(item),
                                    },
                                  );
                                },
                              ),

                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Delete Tender"),
                                        content: const Text(
                                          "Are you sure you want to delete this tender?",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Cancel"),
                                          ),

                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                widget.requirement.remove(item);
                                              });

                                              widget.onRefresh();

                                              Navigator.pop(context);
                                            },
                                            child: const Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),

                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff1A2980),
                                ),
                                icon: const Icon(Icons.gavel),
                                label: const Text("Bid"),
                                onPressed: () {
                                  showBidDialog(item);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
