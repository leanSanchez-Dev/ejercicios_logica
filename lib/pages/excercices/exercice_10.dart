import 'package:ejercicios_logica/utils/data/morse_code.dart';
import 'package:flutter/material.dart';

class Exercice10 extends StatefulWidget {
  const Exercice10({super.key});

  @override
  Exercice10State createState() => Exercice10State();
}

class Exercice10State extends State<Exercice10> {
  String textToMorse(String input) {
    final Map<String, String> reverseMorse = morseCode.map(
      (key, value) => MapEntry(value, key),
    );

    if (input.contains('.') || input.contains('-')) {
      return input
          .split('  ')
          .map(
            (word) =>
                word.split(' ').map((char) => reverseMorse[char] ?? '').join(),
          )
          .join(' ');
    } else {
      return input
          .toUpperCase()
          .split('')
          .map((char) => morseCode[char] ?? '')
          .join(' ');
    }
  }

  String morseResult = "";
  TextEditingController morseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Conversión de Texto a Código Morse y Viceversa',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: morseController,
          decoration: InputDecoration(
            labelText: 'Ingrese texto o código morse',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              morseResult = textToMorse(morseController.text);
            });
          },
          child: const Text('Convertir'),
        ),
        const SizedBox(height: 10),
        if (morseResult.isNotEmpty)
          Text(
            'Resultado: $morseResult',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
