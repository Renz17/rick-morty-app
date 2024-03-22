import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/models/models.dart';
import 'package:rick_and_morty_app/services/character_services.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    final characterService = Provider.of<CharacterServices>(context, listen: true);

    final scrollCOntroller = ScrollController();

    // TODO: implement detail page
    void goToDetailPage(Character character) {
      Navigator.pushNamed(context, 'details', arguments: character);
    }

    scrollCOntroller.addListener(() {
      if (scrollCOntroller.position.pixels == scrollCOntroller.position.maxScrollExtent) {
        characterService.getMoreCharacters();
      }
    });

    return Expanded(
      child: ListView.builder(
        controller: scrollCOntroller,
        itemCount: characterService.characters.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => goToDetailPage(characterService.characters[index]),
            title: Text(characterService.characters[index].name),
            subtitle: Text(characterService.characters[index].status),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  characterService.characters[index].image,
                  scale: 1),
            ),
          );
        },
      ),
    );
  }
}
