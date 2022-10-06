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
              ? const Color(0xFF029EF2)
              : Colors.indigo[100],
        ),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 1
                ? const Color(0xFF029EF2)
                : Colors.indigo[100]),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 2
                ? const Color(0xFF029EF2)
                : Colors.indigo[100]),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 3
                ? const Color(0xFF029EF2)
                : Colors.indigo[100]),
        Icon(Icons.star,
            size: 15,
            color: dificuldade > 4
                ? const Color(0xFF029EF2)
                : Colors.indigo[100]),
      ],
    );
  }
}
