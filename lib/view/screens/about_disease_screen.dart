import 'package:flutter/material.dart';

class AboutDiseaseScreen extends StatelessWidget {
  const AboutDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List diseases = [
      {
        "name": "Coronaviruses (COVID-19)",
        "image": "https://www.nfid.org/wp-content/uploads/2023/03/Coronavirus.png",
        "description": "Coronaviruses are a large family of respiratory viruses that includes COVID-19, Middle EastRespiratory Syndrome (MERS), and Severe Acute Respiratory Syndrome (SARS). Coronavirusescause diseases in animals and humans. They often circulate among camels, cats, and bats, andcan sometimes evolve and infect people.In humans, the viruses can cause mild respiratory infections, like the common cold,but can lead to serious illnesses, like pneumonia.",
      },
      {
        "name": "Ebola",
        "image": "https://www.nfid.org/wp-content/uploads/2023/03/Ebola.jpeg",
        "description": "Ebola is a rare and deadly disease caused by infection with a virus of the family Filoviridae, genus Ebolavirus. Ebola can cause disease in humans and otherprimates (monkeys, gorillas, and chimpanzees).",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diseases List"), 
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final drug = diseases[index];
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
