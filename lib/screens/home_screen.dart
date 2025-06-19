import 'package:flutter/material.dart';
import 'package:trog42/widgets/drawer/end_drawer.dart';
import 'package:trog42/widgets/function_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EndDrawer(),
      body: Builder(
        builder: (innerContext) {
          return Column(
            children: [
              Flexible(
                flex: 1,
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Scaffold.of(innerContext).openEndDrawer();
                              },
                              icon: Icon(Icons.menu_rounded),
                              color: Theme.of(context).colorScheme.onPrimary,
                              iconSize: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FunctionPages(),
              Flexible(flex: 1, child: Container()),
            ],
          );
        },
      ),
    );
  }
}
