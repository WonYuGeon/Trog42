import 'package:flutter/material.dart';
import 'package:trog42/models/function_list.dart';

class FunctionCard extends StatelessWidget {
  final double width;
  final double height;
  final FunctionList function;

  const FunctionCard({
    super.key,
    required this.width,
    required this.height,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          final Widget? destination = routes[function];
          if (destination != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          width: width,
          height: height,
          child: Container(),
        ),
      ),
    );
  }
}
