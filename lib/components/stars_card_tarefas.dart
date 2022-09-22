import 'package:flutter/material.dart';

class StarsCard extends StatelessWidget {
  final int dificuldade;
  const StarsCard ({Key? key, required this.dificuldade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: dificuldade > 0
              ? Colors.indigo
              : Colors.indigo[100],
        ),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 1
                ? Colors.indigo
                : Colors.indigo[100]),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 2
                ? Colors.indigo
                : Colors.indigo[100]),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 3
                ? Colors.indigo
                : Colors.indigo[100]),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 4
                ? Colors.indigo
                : Colors.indigo[100]),
      ],
    );
  }
}
