import 'package:flutter/material.dart';

class Exercice01 extends StatefulWidget {
  const Exercice01({super.key});

  @override
  Exercice01State createState() => Exercice01State();
}

class Exercice01State extends State<Exercice01> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> results = [];
    Color color = Colors.lightBlueAccent;
    Color colorfizzbuzz = Colors.greenAccent;
    Color colorfizz = Colors.redAccent;
    Color colorbuzz = Colors.deepPurpleAccent;

    for (int i = 1; i <= 100; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        results.add({"text": "fizzbuzz", "color": colorfizzbuzz});
      } else if (i % 3 == 0) {
        results.add({"text": "fizz", "color": colorfizz});
      } else if (i % 5 == 0) {
        results.add({"text": "buzz", "color": colorbuzz});
      } else {
        results.add({"text": i.toString(), "color": color});
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Row(children: [Icon(Icons.circle, color: color), Text('normal')]),
            const SizedBox(width: 8),
            Row(children: [Icon(Icons.circle, color: colorfizz), Text('fizz')]),
            const SizedBox(width: 8),
            Row(children: [Icon(Icons.circle, color: colorbuzz), Text('buzz')]),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Card(
                color: results[index]["color"],
                child: ListTile(
                  title: Text(
                    results[index]["text"],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
