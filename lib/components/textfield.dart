import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/services/character_services.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.textFielController,
  });

  final TextEditingController textFielController;
  @override
  Widget build(BuildContext context) {
    void searchCharacter(String value) {
      Provider.of<CharacterServices>(context, listen: false)
          .searchCharacter(value);
    }

    return TextField(
      controller: textFielController,
      onChanged: (value) => searchCharacter(value),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Search character by name',
      ),
    );
  }
}
