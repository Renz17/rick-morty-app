import 'package:flutter/material.dart';

class InfoData extends StatelessWidget {
  const InfoData({
    super.key,
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
  final TextStyle textStyle = const TextStyle(fontSize: 16);
  final TextStyle textStyleBold = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('$name: ', style: textStyle),
          Text(value, style: textStyleBold),
        ],
      ),
    );
  }
}
