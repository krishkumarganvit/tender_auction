// GovAddPg.dart

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4EEF5),

      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,

          margin: const EdgeInsets.all(15),

          padding: const EdgeInsets.all(10),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(12),

                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),

                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add');
                      },

                      icon: const Icon(Icons.add, size: 30),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Text(
                    "Filter By Date : ",

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
                                .map(
                                  (item) => item.date.toString().split(' ')[0],
                                )
                                .toSet()
                                .toList(),
                          ].map((date) {
                            return DropdownMenuItem(
                              value: date,

                              child: Text(date),
                            );
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

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,

                  itemBuilder: (context, index) {
                    final item = filteredList[index];

                    return Container(
                      width: double.infinity,

                      margin: const EdgeInsets.only(bottom: 18),

                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: const Color(0xFFBDBDBD),

                        borderRadius: BorderRadius.circular(15),

                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,

                            blurRadius: 6,

                            offset: Offset(2, 2),
                          ),
                        ],
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  item.title,

                                  style: const TextStyle(
                                    fontSize: 24,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  item.description,

                                  style: const TextStyle(fontSize: 17),
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  item.date.toString().split(' ')[0],

                                  style: const TextStyle(
                                    fontSize: 15,

                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          Column(
                            children: [
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

                                icon: const Icon(Icons.edit, size: 30),
                              ),

                              const SizedBox(height: 8),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.requirement.remove(item);
                                  });

                                  widget.onRefresh();
                                },

                                icon: const Icon(Icons.delete, size: 30),
                              ),
                            ],
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
      ),
    );
  }
}
