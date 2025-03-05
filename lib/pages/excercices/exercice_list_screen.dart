import 'package:ejercicios_logica/models/exercice.dart';
import 'package:ejercicios_logica/pages/excercices/exercice_detail_screen.dart';
import 'package:flutter/material.dart';

class ExerciceListScreen extends StatefulWidget {
  final List<Exercice> exercice;

  const ExerciceListScreen({super.key, required this.exercice});

  @override
  State<ExerciceListScreen> createState() => _ExerciceListScreenState();
}

class _ExerciceListScreenState extends State<ExerciceListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicios de Lógica'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/dev_bg.png',
                    key: const ValueKey<String>('dev_bg'),
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leonardo Sanchez',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Leans-Dev',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          'Desarrollador FrontEnd | Mobile | Flutter | Dart | java Mobile',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400,
                          ),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.code_rounded),
                SizedBox(width: 10),
                Text(
                  'Cantidad de ejercicios: #${widget.exercice.length}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey.shade800,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.exercice.length,
              itemBuilder: (context, index) {
                final item = widget.exercice[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: Text(
                      '#${item.id}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.double_arrow_rounded),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text('Dificultad: '),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color:
                                item.difficulty == 'Fácil'
                                    ? Colors.green.shade400
                                    : item.difficulty == 'Medio'
                                    ? Colors.yellowAccent.shade700
                                    : item.difficulty == 'Difícil'
                                    ? Colors.red.shade300
                                    : Colors.deepPurpleAccent.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item.difficulty.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ExerciceDetailScreen(exercice: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
