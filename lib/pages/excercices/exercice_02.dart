import 'package:flutter/material.dart';

class Exercice02 extends StatefulWidget {
  const Exercice02({super.key});

  @override
  Exercice02State createState() => Exercice02State();
}

class Exercice02State extends State<Exercice02> {
  String word1 = "";
  String word2 = "";
  bool result = false;
  bool isAnagram(String word1, String word2) {
    if (word1 == word2) return false;
    List<String> sortedWord1 = word1.split('')..sort();
    List<String> sortedWord2 = word2.split('')..sort();
    return sortedWord1.join() == sortedWord2.join();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Center(
          child: const Text(
            'Verificar Anagramas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(labelText: 'Palabra 1'),
          onChanged: (value) {
            setState(() => word1 = value.toLowerCase());
          },
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(labelText: 'Palabra 2'),
          onChanged: (value) {
            setState(() => word2 = value.toLowerCase());
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              result = isAnagram(word1, word2);
            });
          },
          child: const Text('Comprobar'),
        ),
        const SizedBox(height: 10),
        Center(
          child: Chip(
            backgroundColor: result ? Colors.green : Colors.red,
            label: Text(
              result ? 'Son anagramas' : 'No son anagramas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
