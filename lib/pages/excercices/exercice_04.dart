import 'package:flutter/material.dart';

class Exercice04 extends StatefulWidget {
  const Exercice04({super.key});

  @override
  Exercice04State createState() => Exercice04State();
}

class Exercice04State extends State<Exercice04> {
  bool isPrime(int number) {
    if (number < 2) {
      return false;
    } else {
      for (int i = 2; i <= number / 2; i++) {
        if (number % i == 0) {
          return false;
        }
      }

      return true;
    }

    // if (number < 2) return false;
    // for (int i = 2; i * i <= number; i++) {
    //   if (number % i == 0) return false;
    // }
    // return true;
  }

  @override
  Widget build(BuildContext context) {
    List<int> primes = [];
    for (int i = 2; i <= 100; i++) {
      if (isPrime(i)) {
        primes.add(i);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            shrinkWrap: true,
            itemCount: primes.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                  child: Text(
                    primes[index].toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
