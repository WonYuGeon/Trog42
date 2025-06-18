// main.dart 또는 별도 파일에 생성
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // 기본값은 시스템 설정 따르기

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners(); // 상태 변경 알림
  }
}