import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/models.dart';

class CharacterServices extends ChangeNotifier {
  final String _baseUrl = 'https://rickandmortyapi.com/api/character';

  List<Character> characters = [];
  InfoCharacterResponse info =
      InfoCharacterResponse(count: 0, pages: 0, next: '', prev: '');

  CharacterServices() {
    getCharacters();
  }

  getCharacters() async {
    var url = Uri.parse(_baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final characterResponse =
          CharactersResponse.fromJson(json.decode(response.body));
      characters = characterResponse.results;
      info = characterResponse.info;
    } else {
      characters = [];
    }
    notifyListeners();
  }

  getMoreCharacters() async {
    if (info.next == null) return;
    final url = Uri.parse(info.next);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final characterResponse = CharactersResponse.fromJson(json.decode(response.body));
      info = characterResponse.info;
      characters.addAll(characterResponse.results);
    } else {
      characters = [];
    }
    notifyListeners();
  }

  searchCharacter(String query) async {
    var url = Uri.parse('$_baseUrl/?name=$query');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final characterResponse =
          CharactersResponse.fromJson(json.decode(response.body));
      characters = characterResponse.results;
      info = characterResponse.info;
    } else {
      characters = [];
    }
    notifyListeners();
  }
}
