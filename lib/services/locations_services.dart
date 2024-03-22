import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/models.dart';

class LocationsServices extends ChangeNotifier {
  final String _baseUrl = 'https://rickandmortyapi.com/api/location';

  List<Location> locations = [];
  InfoLocationsResponse info =
      InfoLocationsResponse(count: 0, pages: 0, next: '', prev: '');

  LocationsServices() {
    getLocations();
  }

  getLocations() async {
    var url = Uri.parse(_baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final locationResponse =
          LocationsResponse.fromJson(json.decode(response.body));
      locations = locationResponse.results;
      info = locationResponse.info;
    } else {
      locations = [];
    }
    notifyListeners();
  }

  getMoreLocations() async {
    if (info.next != null) {
      var url = Uri.parse(info.next);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final locationResponse =
            LocationsResponse.fromJson(json.decode(response.body));
        locations.addAll(locationResponse.results);
        info = locationResponse.info;
      } else {
        locations = [];
      }
      notifyListeners();
    }
  }

  Location getLocationByURL(String url) {
    try {
      if (locations.isEmpty) return Location(id: 0, name: '', type: '', dimension: '', residents: [], url: '', created: DateTime.now());
      final episode = locations.firstWhere((element) => element.url == url);
      return episode;
    } catch (e) {
      getMoreLocations();
      return Location(id: 0, name: '', type: '', dimension: '', residents: [], url: '', created: DateTime.now());
    }
  }
}
