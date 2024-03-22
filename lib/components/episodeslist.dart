import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/models/models.dart';
import 'package:rick_and_morty_app/services/episodes_services.dart';

class EpisodesList extends StatelessWidget {
  EpisodesList({
    super.key,
    required this.episodesUrls,
  });

  List<String> episodesUrls = [];

  @override
  Widget build(BuildContext context) {
    final episodesService =
        Provider.of<EpisodesServices>(context, listen: true);

    return Expanded(
      child: ListView.builder(
        itemCount: episodesUrls.length,
        itemBuilder: (context, index) {
          final episode = episodesService.getEpisodeByURL(episodesUrls[index]);
          return ListTile(
            title: Text(episode.name),
            subtitle: Text(episode.episode),
          );
        },
      ),
    );
  }
}
