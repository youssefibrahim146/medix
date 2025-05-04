import 'package:flutter/material.dart';

class DrugScreen extends StatelessWidget {
  const DrugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List drugs = [
      {
        "name": "Adol Caplets 500mg 24's",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQea03YJkgVHYcWJnbBRqPngopLFEatmTL-JQ&s",
        "description": "Adol Caplets Paracetamol 500mg is an anti-inflammatory painkiller used to relieve mild to moderate pain such as headache, migraine, backache, rheumatic aches, period pain, toothache, pain following dental procedures,and discomfort that accompanies cold, flu, and sore throat. - Effectively reduces feverthat may accompany various types of infections specially in case of cold or flu.",
      },
      {
        "name": "Adancor  10mg ",
        "image": "https://delmar-test.linkedgates.com/images/items/120402.JPEG",
        "description": "Adancor contains the active substance nicorandil.This belongs to a group of medicinescalled potassium channel activators. Adancor is an antianginal and vasodilator drug.",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drugs List"),
      ),
      body: ListView.builder(
        itemCount: drugs.length,
        itemBuilder: (context, index) {
          final drug = drugs[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  // Image on the left
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      drug["image"],
                      width: 70,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Text data on the right
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drug["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          drug["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
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
