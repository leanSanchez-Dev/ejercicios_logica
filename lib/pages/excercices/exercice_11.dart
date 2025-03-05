import 'package:flutter/material.dart';

class Exercice11 extends StatefulWidget {
  const Exercice11({super.key});

  @override
  Exercice11State createState() => Exercice11State();
}

class Exercice11State extends State<Exercice11> {
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

  @override
  Widget build(BuildContext context) {
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
}
