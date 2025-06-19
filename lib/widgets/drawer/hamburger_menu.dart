import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
      icon: Icon(Icons.menu_rounded),
      color: Theme.of(context).colorScheme.onPrimary,
      iconSize: 35,
    );
  }
}
