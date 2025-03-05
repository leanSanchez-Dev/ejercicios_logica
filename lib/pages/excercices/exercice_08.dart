import 'package:flutter/material.dart';

class Exercice08 extends StatefulWidget {
  const Exercice08({super.key});

  @override
  Exercice08State createState() => Exercice08State();
}

class Exercice08State extends State<Exercice08> {
  Map<String, int> countWords(String text) {
    Map<String, int> wordMap = {};
    String cleanedText =
        text.replaceAll(RegExp(r'[^a-zA-Z0-9áéíóúÁÉÍÓÚñÑ ]'), '').toLowerCase();
    List<String> words = cleanedText.split(RegExp(r'\s+'));
    for (String word in words) {
      if (word.isNotEmpty) {
        wordMap[word] = (wordMap[word] ?? 0) + 1;
      }
    }
    return wordMap;
  }

  Map<String, int> wordCount = {};
  TextEditingController wordCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sortedEntries =
        wordCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contar palabras repetidas',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: wordCountController,
          decoration: InputDecoration(
            labelText: 'Ingrese el texto',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              wordCount = countWords(wordCountController.text);
            });
          },
          child: const Text('Contar Palabras'),
        ),
        const SizedBox(height: 10),
        if (wordCount.isNotEmpty)
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                childAspectRatio: 2,
              ),
              itemCount: wordCount.entries.length,
              itemBuilder: (context, index) {
                final entry = sortedEntries[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text('${entry.key}: ${entry.value}'),
                    ), //center text
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
