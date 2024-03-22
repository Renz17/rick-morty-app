// routes file for flutter

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/details.dart';
import 'package:rick_and_morty_app/screens/home.dart';

final Map<String, WidgetBuilder> routes = {
  'home': (context) => const Home(),
  'details': (context) => const DetailsScreen(),
};