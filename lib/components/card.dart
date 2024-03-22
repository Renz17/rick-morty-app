import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/models.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(character.image),
          ),
          Text(character.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(character.status, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
