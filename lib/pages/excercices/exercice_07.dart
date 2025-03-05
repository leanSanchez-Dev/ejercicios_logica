import 'package:flutter/material.dart';

class Exercice07 extends StatefulWidget {
  const Exercice07({super.key});

  @override
  Exercice07State createState() => Exercice07State();
}

class Exercice07State extends State<Exercice07> {
  TextEditingController textController = TextEditingController();
  String reversedText = "";

  String reverseString(String text) {
    String reversed = "";
    for (int i = text.length - 1; i >= 0; i--) {
      reversed += text[i];
    }
    return reversed;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Invertir una cadena de texto',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: 'Ingrese el texto',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              reversedText = reverseString(textController.text);
            });
          },
          child: const Text('Invertir Texto'),
        ),
        const SizedBox(height: 10),
        if (reversedText.isNotEmpty)
          Text(
            'Texto Invertido: $reversedText',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
