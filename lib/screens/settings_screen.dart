import 'package:flutter/material.dart';
import 'package:trog42/widgets/settings/setting_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Transform.scale(
              scale: 1.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Center(
                  child: Text(
                    '설정',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: (40 / 1.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(children: [SettingTheme()]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
