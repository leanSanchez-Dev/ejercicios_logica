import 'dart:typed_data';
import 'package:ejercicios_logica/pages/excercices/exercice_01.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_02.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_03.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_04.dart';
import 'package:ejercicios_logica/utils/data/morse_code.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

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
        return Expanded(child: exercice5());
      case 6:
        return Expanded(child: exercice6());
      case 7:
        return Expanded(child: exercice7());
      case 8:
        return Expanded(child: exercice8());
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

  double calcularArea(
    String tipo, {
    double base = 0,
    double altura = 0,
    double lado = 0,
  }) {
    switch (tipo.toLowerCase()) {
      case "triangulo":
        return (base * altura) / 2;
      case "cuadrado":
        return lado * lado;
      case "rectangulo":
        return base * altura;
      default:
        return 0;
    }
  }

  String selectedPolygon = "triangulo";
  double base = 0, altura = 0, lado = 0;
  double area = 0;

  exercice5() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cálculo del área de polígonos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        DropdownButton<String>(
          padding: EdgeInsets.all(10),
          isDense: true,
          // isExpanded: true,
          dropdownColor: Colors.white,
          alignment: Alignment.center,

          icon: const Icon(Icons.arrow_drop_down_rounded),
          // ignore: deprecated_member_use
          iconEnabledColor: Color(Colors.deepPurpleAccent.value),
          value: selectedPolygon,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          underline: Container(
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurpleAccent,
            ),
          ),
          items:
              ["triangulo", "cuadrado", "rectangulo"]
                  .map(
                    (e) => DropdownMenuItem(
                      alignment: Alignment.center,
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
          onChanged: (value) {
            setState(() {
              selectedPolygon = value!;
              area = calcularArea(
                selectedPolygon,
                base: base,
                altura: altura,
                lado: lado,
              );
            });
          },
        ),
        if (selectedPolygon != "cuadrado")
          TextField(
            decoration: InputDecoration(labelText: 'Base'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                base = double.tryParse(value) ?? 0;
                area = calcularArea(
                  selectedPolygon,
                  base: base,
                  altura: altura,
                  lado: lado,
                );
              });
            },
          ),
        if (selectedPolygon != "cuadrado")
          TextField(
            decoration: InputDecoration(labelText: 'Altura'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                altura = double.tryParse(value) ?? 0;
                area = calcularArea(
                  selectedPolygon,
                  base: base,
                  altura: altura,
                  lado: lado,
                );
              });
            },
          ),
        if (selectedPolygon == "cuadrado")
          TextField(
            decoration: InputDecoration(labelText: 'Lado'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                lado = double.tryParse(value) ?? 0;
                area = calcularArea(
                  selectedPolygon,
                  base: base,
                  altura: altura,
                  lado: lado,
                );
              });
            },
          ),
        const SizedBox(height: 10),
        Text(
          'Área calculada: $area',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  String aspectRatio = '';
  TextEditingController urlController = TextEditingController();

  String calculateAspectRatio(int width, int height) {
    int gcd = findGCD(width, height);
    int numerator = width ~/ gcd;
    int denominator = height ~/ gcd;
    return '$numerator:$denominator';
  }

  Future<void> fetchImageSize(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Uint8List bytes = response.bodyBytes;
        img.Image? image = img.decodeImage(bytes);
        if (image != null) {
          setState(() {
            aspectRatio = calculateAspectRatio(image.width, image.height);
          });
        } else {
          setState(() {
            aspectRatio = 'Error: No se pudo decodificar la imagen.';
          });
        }
      } else {
        setState(() {
          aspectRatio = 'Error al cargar la imagen: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        aspectRatio = 'Error: $e';
      });
    }
  }

  int findGCD(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  exercice6() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Calcular Aspect Ratio de una Imagen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: urlController,
            decoration: const InputDecoration(
              labelText: 'Ingrese la URL de la imagen',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => fetchImageSize(urlController.text),
            child: const Text('Calcular Aspect Ratio'),
          ),
          const SizedBox(height: 10),
          if (aspectRatio.isNotEmpty)
            Text(
              'Aspect Ratio: $aspectRatio',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  String reverseString(String text) {
    String reversed = "";
    for (int i = text.length - 1; i >= 0; i--) {
      reversed += text[i];
    }
    return reversed;
  }

  TextEditingController textController = TextEditingController();
  String reversedText = "";

  exercice7() {
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

  exercice8() {
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
