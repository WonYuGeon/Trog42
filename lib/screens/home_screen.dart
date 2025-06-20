import 'package:flutter/material.dart';
import 'package:trog42/widgets/drawer/end_drawer.dart';
import 'package:trog42/widgets/drawer/hamburger_menu.dart';
import 'package:trog42/widgets/feature/function_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EndDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [HamburgerMenu()],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FunctionPages(),
            Flexible(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
