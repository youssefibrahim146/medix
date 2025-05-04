import 'package:flutter/material.dart';

class UlternativeDrugScreen extends StatelessWidget {
  const UlternativeDrugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List ultternativeDrug = [
      {
        "name": "Avil",
        "image": "https://dkud4u09qff41.cloudfront.net/Products/7f8cf36a-d6ce-4862-826f-3d6952f394d6.jpeg",
        "ulternative_name": "Tavegyl",
        "ulternative_image": "https://5.imimg.com/data5/SELLER/Default/2022/9/CG/KC/BW/101315720/1-mg-clemastine-tablets.jpg",
      },
      {
        "name": "cefotax",
        "image": "https://media.gemini.media/img/large/2021/8/10/2021_8_10_23_33_31_463.jpg",
        "ulternative_name": "ceforan",
        "ulternative_image": "https://taypharmacies.com/wp-content/uploads/2023/01/CEFORAN-1-GM-1-VIAL.jpg",
      },

    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drugs List"),
      ),
      body: ListView.builder(
        itemCount: ultternativeDrug.length,
        itemBuilder: (context, index) {
          final drug = ultternativeDrug[index];
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
                  Text(
                    drug["name"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Icon(Icons.arrow_forward),
                  const SizedBox(width: 10),
                  Image.network(
                    drug["ulternative_image"],
                    width: 70,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    drug["ulternative_name"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
