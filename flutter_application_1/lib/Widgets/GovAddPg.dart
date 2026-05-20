import 'package:flutter/material.dart';



class Govaddpg extends StatefulWidget {
  const Govaddpg({super.key});

  @override
  State<Govaddpg> createState() => _GovaddpgState();
}

class _GovaddpgState extends State<Govaddpg> {
  

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: requirementList.length,

                itemBuilder: (context, index) {
                  final item = requirementList[index];

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
                        Expanded(
                          child: Column(
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
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/edit',
                              arguments: {
                                'id': item.id,
                                'title': item.title,
                                'description': item.description,
                                'date': item.date.toString(),
                              },
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              requirementList.removeAt(index);
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
