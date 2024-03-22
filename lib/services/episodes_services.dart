import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/models.dart';

class EpisodesServices extends ChangeNotifier {
  final String _baseUrl = 'https://rickandmortyapi.com/api/episode';

  List<Episode> episodes = [];
  InfoEpisodesResponse info =
      InfoEpisodesResponse(count: 0, pages: 0, next: '', prev: '');

  EpisodesServices() {
    getEpisodes();
  }

  getEpisodes() async {
    var url = Uri.parse(_baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final episodeResponse =
          EpisodesResponse.fromJson(json.decode(response.body));
      episodes = episodeResponse.results;
      info = episodeResponse.info;
    } else {
      episodes = [];
    }
    notifyListeners();
  }

  getMoreEpisodes() async {
    if (info.next != null) {
      var url = Uri.parse(info.next);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final episodeResponse =
            EpisodesResponse.fromJson(json.decode(response.body));
        episodes.addAll(episodeResponse.results);
        info = episodeResponse.info;
      } else {
        episodes = [];
      }
      notifyListeners();
    }
  }

  Episode getEpisodeByURL(String url) {
    try {
      if (episodes.isEmpty) return Episode(id: 0, name: '', airDate: '', episode: '', characters: [], url: '', created: DateTime.now());
      final episode = episodes.firstWhere((element) => element.url == url);
      return episode;
    } catch (e) {
      getMoreEpisodes();
      return Episode(id: 0, name: '', airDate: '', episode: '', characters: [], url: '', created: DateTime.now());
    }
  }
}
