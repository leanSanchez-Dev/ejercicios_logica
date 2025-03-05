import 'package:ejercicios_logica/pages/excercices/exercice_01.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_02.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_03.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_04.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_05.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_06.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_07.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_08.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_09.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_10.dart';

import 'package:ejercicios_logica/models/exercice.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_11.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_12.dart';
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
        return Expanded(child: Exercice09());
      case 10:
        return Expanded(child: Exercice10());
      case 11:
        return Expanded(child: Exercice11());
      case 12:
        return Expanded(child: Exercice12());
      default:
        return Center(child: Text('No hay contenido para este ejercicio'));
    }
  }
}
