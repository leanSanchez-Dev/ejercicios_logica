import 'package:ejercicios_logica/pages/excercices/exercice_01.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_02.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_03.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_04.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_05.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_06.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_07.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_08.dart';
import 'package:ejercicios_logica/utils/data/morse_code.dart';

import 'package:ejercicios_logica/models/exercice.dart';
import 'package:flutter/material.dart';

class ExerciceDetailScreen extends StatefulWidget {
  final Exercice exercice;

  const ExerciceDetailScreen({super.key, required this.exercice});

  @override
  State<ExerciceDetailScreen> createState() => _ExerciceDetailScreenState();
}

class _ExerciceDetailScreenState extends State<ExerciceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.exercice.title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exercice.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text('Dificultad: '),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  widget.exercice.difficulty == 'Fácil'
                                      ? Colors.green.shade400
                                      : widget.exercice.difficulty == 'Medio'
                                      ? Colors.yellowAccent.shade700
                                      : widget.exercice.difficulty == 'Difícil'
                                      ? Colors.red.shade300
                                      : Colors.deepPurpleAccent.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.exercice.difficulty.toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'ID:${widget.exercice.number}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            exerciceContentWidget(widget.exercice.id),
          ],
        ),
      ),
    );
  }

  exerciceContentWidget(int id) {
    switch (id) {
      case 1:
        return Expanded(child: Exercice01());
      case 2:
        return Expanded(child: Exercice02());
      case 3:
        return Expanded(child: Exercice03());
      case 4:
        return Expanded(child: Exercice04());
      case 5:
        return Expanded(child: Exercice05());
      case 6:
        return Expanded(child: Exercice06());
      case 7:
        return Expanded(child: Exercice07());
      case 8:
        return Expanded(child: Exercice08());
      case 9:
        return Expanded(child: exercice9());
      case 10:
        return Expanded(child: exercice10());
      case 11:
        return Expanded(child: exercice11());
      case 12:
        return Expanded(child: exercice12());
      default:
        return Center(child: Text('No hay contenido para este ejercicio'));
    }
  }

  String decimalToBinary(int number) {
    if (number == 0) return "0";
    String binary = "";
    while (number > 0) {
      binary = (number % 2).toString() + binary;
      number ~/= 2;
    }
    return binary;
  }

  String binaryResult = "";
  TextEditingController decimalController = TextEditingController();

  exercice9() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Convertir Decimal a Binario',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: decimalController,
          decoration: InputDecoration(
            labelText: 'Ingrese un número decimal',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              binaryResult = decimalToBinary(
                int.tryParse(decimalController.text) ?? 0,
              );
            });
          },
          child: const Text('Convertir a Binario'),
        ),
        const SizedBox(height: 10),
        if (binaryResult.isNotEmpty)
          Text(
            'Binario: $binaryResult',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }

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

  exercice10() {
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

  bool isBalanced(String expression) {
    List<String> stack = [];
    Map<String, String> pairs = {')': '(', ']': '[', '}': '{'};

    for (var char in expression.split('')) {
      if (pairs.values.contains(char)) {
        stack.add(char);
      } else if (pairs.keys.contains(char)) {
        if (stack.isEmpty || stack.removeLast() != pairs[char]) {
          return false;
        }
      }
    }
    return stack.isEmpty;
  }

  String balanceResult = "";
  TextEditingController balanceController = TextEditingController();
  exercice11() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verificar Balanceo de Expresiones',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: balanceController,
          decoration: InputDecoration(
            labelText: 'Ingrese la expresión',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              balanceResult =
                  isBalanced(balanceController.text)
                      ? "La expresión está balanceada"
                      : "La expresión NO está balanceada";
            });
          },
          child: const Text('Verificar'),
        ),
        const SizedBox(height: 10),
        if (balanceResult.isNotEmpty)
          Text(
            'Resultado: $balanceResult',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }

  List<String> findUniqueCharacters(String str1, String str2) {
    String out1 = "";
    String out2 = "";

    for (var char in str1.runes) {
      if (!str2.contains(String.fromCharCode(char))) {
        out1 += String.fromCharCode(char);
      }
    }
    for (var char in str2.runes) {
      if (!str1.contains(String.fromCharCode(char))) {
        out2 += String.fromCharCode(char);
      }
    }
    return [out1, out2];
  }

  TextEditingController string1Controller = TextEditingController();
  TextEditingController string2Controller = TextEditingController();

  String out1 = "", out2 = "";

  exercice12() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Diferencia de Caracteres entre dos Cadenas',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: string1Controller,
          decoration: InputDecoration(
            labelText: 'Ingrese la primera cadena',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: string2Controller,
          decoration: InputDecoration(
            labelText: 'Ingrese la segunda cadena',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              var result = findUniqueCharacters(
                string1Controller.text,
                string2Controller.text,
              );
              out1 = result[0];
              out2 = result[1];
            });
          },
          child: const Text('Calcular'),
        ),
        const SizedBox(height: 10),
        if (out1.isNotEmpty || out2.isNotEmpty)
          Column(
            children: [
              Text(
                'Caracteres en la 1ra pero no en la 2da: $out1',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Caracteres en la 2da pero no en la 1ra: $out2',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
      ],
    );
  }
}
