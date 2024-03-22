// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/components/appbar.dart';
import 'package:rick_and_morty_app/components/chatacterlist.dart';
import 'package:rick_and_morty_app/components/textfield.dart';
import 'package:rick_and_morty_app/services/character_services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final textFielController = TextEditingController();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarComponent(),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFieldComponent(textFielController: textFielController),
            SizedBox(height: 10),
            CharacterList(),
          ],
        ),
      ),
    );
  }
}
