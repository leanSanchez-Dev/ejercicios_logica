import 'package:flutter/material.dart';

class Exercice09 extends StatefulWidget {
  const Exercice09({super.key});

  @override
  Exercice09State createState() => Exercice09State();
}

class Exercice09State extends State<Exercice09> {
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

  @override
  Widget build(BuildContext context) {
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
}
