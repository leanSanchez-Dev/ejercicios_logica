import 'package:flutter/material.dart';

class Exercice03 extends StatefulWidget {
  const Exercice03({super.key});

  @override
  Exercice03State createState() => Exercice03State();
}

class Exercice03State extends State<Exercice03> {
  @override
  Widget build(BuildContext context) {
    List<int> results = [0, 1];

    for (int i = 2; i < 50; i++) {
      results.add(results[i - 1] + results[i - 2]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    results[index].toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
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
