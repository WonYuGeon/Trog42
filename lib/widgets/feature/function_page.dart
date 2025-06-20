import 'package:flutter/material.dart';
import 'package:trog42/constants/feature/feature_category.dart';
import 'package:trog42/models/feature/feature.dart';
import 'package:trog42/widgets/feature/function_card.dart';

class FunctionPage extends StatelessWidget {
  const FunctionPage({
    super.key,
    required this.scale,
    required this.maxWidth,
    required this.feature,
  });

  final double scale;
  final double maxWidth;
  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FunctionCard(
            width: maxWidth * 0.6,
            height: maxWidth * 0.6 * 1.4,
            feature: feature,
          ),
          const SizedBox(height: 10),
          Text(
            feature.name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            feature.category.displayName,
            style: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onPrimary.withValues(alpha: 0.5),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
