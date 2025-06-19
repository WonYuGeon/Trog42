import 'package:flutter/material.dart';
import 'package:trog42/models/function_list.dart';
import 'package:trog42/models/function_tilte_list.dart';
import 'package:trog42/widgets/function_card_view.dart';

class FunctionPage extends StatelessWidget {
  const FunctionPage({
    super.key,
    required this.scale,
    required this.maxWidth,
    required this.title,
    required this.function,
  });

  final double scale;
  final double maxWidth;
  final FunctionTitleList title;
  final FunctionList function;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FunctionCard(width: maxWidth * 0.6, height: maxWidth * 0.6 * 1.5),
          const SizedBox(height: 10),
          Text(
            function.displayName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title.displayName,
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