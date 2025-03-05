import 'package:flutter/material.dart';

class Exercice05 extends StatefulWidget {
  const Exercice05({super.key});

  @override
  Exercice05State createState() => Exercice05State();
}

class Exercice05State extends State<Exercice05> {
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

  @override
  Widget build(BuildContext context) {
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
}
