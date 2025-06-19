// lib/screens/placeholder_screen.dart

import 'package:flutter/material.dart';

// 네비게이션 테스트를 위한 임시 화면입니다.
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title 화면',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}