import 'package:ejercicios_logica/models/exercice.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_list_screen.dart';
import 'package:ejercicios_logica/utils/data/data_exercice.dart';
import 'package:flutter/material.dart';

void main() {
  final excercice =
      (dataExcercices['ejercicios_logica'] as List)
          .map((ejercicio) => Exercice.fromJson(ejercicio))
          .toList();

  runApp(MyApp(excercice: excercice));
}

class MyApp extends StatelessWidget {
  final List<Exercice> excercice;

  const MyApp({super.key, required this.excercice});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicios de Lógica',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExerciceListScreen(exercice: excercice),
    );
  }
}
