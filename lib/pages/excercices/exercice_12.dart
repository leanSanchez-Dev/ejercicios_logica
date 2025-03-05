import 'package:flutter/material.dart';

class Exercice12 extends StatefulWidget {
  const Exercice12({super.key});

  @override
  Exercice12State createState() => Exercice12State();
}

class Exercice12State extends State<Exercice12> {
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

  @override
  Widget build(BuildContext context) {
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
