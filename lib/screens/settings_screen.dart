import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 1, child: Container()),
          Flexible(flex: 4, child: Container()),
        ],
      ),
    );
  }
}
