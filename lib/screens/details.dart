import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/components/card.dart';
import 'package:rick_and_morty_app/components/chatacterlist.dart';
import 'package:rick_and_morty_app/components/episodeslist.dart';
import 'package:rick_and_morty_app/components/locationinfo.dart';
import 'package:rick_and_morty_app/models/models.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ButtonStyle redButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
  );

  ButtonStyle greenButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
  );

  bool isEpisodes = true;

  changeOption(String option) {
    switch (option) {
      case 'episodes':
        setState(() {
          isEpisodes = true;
        });
        break;
      case 'locations':
        setState(() {
          isEpisodes = false;
        });
        break;
      default:
        setState(() {
          isEpisodes = true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    // get arguments from route
    final Character character =
        ModalRoute.of(context)!.settings.arguments as Character;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details of ${character.name}'),
      ),
      body: Column(children: [
        Center(child: CardComponent(character: character)),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            // Group: Button to make visible, episode list, location list
            ElevatedButton(
              onPressed: () => changeOption('episodes'),
              style: isEpisodes ? greenButtonStyle : redButtonStyle,
              child: const Text('Episodes'),
            ),
            ElevatedButton(
              onPressed: () => changeOption('locations'),
              style: isEpisodes ? redButtonStyle : greenButtonStyle,
              child: const Text('Character Location'),
            ),
          ],
        ),
        if (isEpisodes)
          EpisodesList(episodesUrls: character.episode)
        else
          LocationInfo(locationUrl: character.location.url),
      ]),
    );
  }
}
