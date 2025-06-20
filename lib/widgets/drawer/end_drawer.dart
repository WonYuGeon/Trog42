import 'package:flutter/material.dart' hide DrawerHeader;
import 'package:trog42/widgets/drawer/drawer_body.dart';
import 'package:trog42/widgets/drawer/drawer_header.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return SizedBox(
          width: maxWidth * 0.8,
          child: Drawer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    DrawerHeader(),
                    const Divider(),
                    DrawerBody(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
