import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class Exercice06 extends StatefulWidget {
  const Exercice06({super.key});

  @override
  Exercice06State createState() => Exercice06State();
}

class Exercice06State extends State<Exercice06> {
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

  @override
  Widget build(BuildContext context) {
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
}
