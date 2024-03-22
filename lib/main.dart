import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/routes/routes.dart';
import 'package:rick_and_morty_app/services/character_services.dart';
import 'package:rick_and_morty_app/services/episodes_services.dart';
import 'package:rick_and_morty_app/services/locations_services.dart';

void main() {
  runApp(const ProviderApp());
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterServices(), lazy: false),
        ChangeNotifierProvider(create: (_) => EpisodesServices(), lazy: false),
        ChangeNotifierProvider(create: (_) => LocationsServices(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: routes,
    );
  }
}
