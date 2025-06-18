import 'package:flutter/material.dart';
import 'package:trog42/widgets/drawer/end_drawer.dart';
import 'package:trog42/widgets/function_card_view.dart';

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
              Flexible(
                flex: 3,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double maxWidth = constraints.maxWidth;
                    // final double maxHeight = constraints.maxHeight;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.2),
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Transform.translate(
                            offset: Offset(0, -20),
                            child: Column(
                              children: [
                                FunctionCard(
                                  width: maxWidth * 0.6,
                                  height: maxWidth * 0.6 * 1.5,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'data',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder:
                            (context, index) => SizedBox(width: maxWidth * 0.2),
                      ),
                    );
                  },
                ),
              ),
              Flexible(flex: 1, child: Container()),
            ],
          );
        },
      ),
    );
  }
}
