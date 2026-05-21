import 'package:flutter/material.dart';

class GovaddpgState extends StatefulWidget {
  final List<dynamic> requirement;

  const GovaddpgState({super.key, required this.requirement});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // ADD BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add');
                  },

                  icon: const Icon(Icons.add, size: 30),
                ),
              ],
            ),

            // FILTER DROPDOWN
            Row(
              children: [
                const Text(
                  "Filter By Date : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),

                const SizedBox(width: 10),

                DropdownButton<String>(
                  value: selectedFilter,

                  items:
                      [
                        "All",

                        ...widget.requirement
                            .map((item) => item.date.toString().split(' ')[0])
                            .toSet()
                            .toList(),
                      ].map((date) {
                        return DropdownMenuItem(value: date, child: Text(date));
                      }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedFilter = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 15),

            // LIST
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,

                itemBuilder: (context, index) {
                  final item = filteredList[index];

                  return Container(
                    width: double.infinity,

                    margin: const EdgeInsets.only(bottom: 15),

                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: const Color(0xFFBDBDBD),

                      borderRadius: BorderRadius.circular(10),

                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,

                          blurRadius: 8,

                          offset: Offset(2, 2),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              item.title,

                              style: const TextStyle(
                                fontSize: 18,

                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(item.description),

                            const SizedBox(height: 5),

                            Text(item.date.toString().split(' ')[0]),
                          ],
                        ),

                        const Spacer(),

                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,

                              '/edit',

                              arguments: {
                                'index': widget.requirement.indexOf(item),
                              },
                            );
                          },

                          icon: const Icon(Icons.edit),
                        ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.requirement.remove(item);
                            });
                          },

                          icon: const Icon(Icons.delete),
                        ),
                      ],
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
