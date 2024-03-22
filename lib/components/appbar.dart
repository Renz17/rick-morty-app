import 'package:flutter/material.dart';


class AppBarComponent extends StatelessWidget {
  const AppBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Rick and Morty App'),
      centerTitle: true,
      elevation: 1,
    );
  }
}