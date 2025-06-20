import 'package:flutter/material.dart';
import 'package:trog42/models/feature/feature.dart';

class FunctionCard extends StatelessWidget {
  final double width;
  final double height;
  final Feature feature;

  const FunctionCard({
    super.key,
    required this.width,
    required this.height,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          final Widget destination = feature.route;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
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
