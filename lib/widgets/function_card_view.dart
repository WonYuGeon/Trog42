import 'package:flutter/material.dart';

class FunctionCard extends StatelessWidget {
  final double width;
  final double height;

  const FunctionCard({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        width: width,
        height: height,
        child: Container(),
      ),
    );
  }
}
