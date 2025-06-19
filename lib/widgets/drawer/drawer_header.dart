import 'package:flutter/material.dart';
import 'package:trog42/screens/settings_screen.dart';

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.settings_rounded),
                color: Theme.of(context).colorScheme.onPrimary,
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_rounded),
                color: Theme.of(context).colorScheme.onPrimary,
                iconSize: 35,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close_rounded),
          color: Theme.of(context).colorScheme.onPrimary,
          iconSize: 35,
        ),
      ],
    );
  }
}
