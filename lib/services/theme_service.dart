// lib/services/theme_service.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  final _tag = 'selectedThemeMode';
  final _themeModes = ['라이트', '다크', '시스템'];

  // 테마 모드를 SharedPreferences에 문자열로 저장
  Future<void> saveTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    String themeName;
    switch (mode) {
      case ThemeMode.light:
        themeName = _themeModes[0]; // '라이트'
        break;
      case ThemeMode.dark:
        themeName = _themeModes[1]; // '다크'
        break;
      default:
        themeName = _themeModes[2]; // '시스템'
        break;
    }
    await prefs.setString(_tag, themeName);
  }

  // SharedPreferences에서 저장된 테마 모드를 불러오기
  Future<ThemeMode> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeName = prefs.getString(_tag);

    switch (savedThemeName) {
      case '라이트':
        return ThemeMode.light;
      case '다크':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  // 문자열 이름을 ThemeMode로 변환
  ThemeMode getThemeModeFromString(String themeName) {
     switch (themeName) {
      case '라이트':
        return ThemeMode.light;
      case '다크':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  // ThemeMode를 문자열 이름으로 변환
  String getStringFromThemeMode(ThemeMode mode) {
     switch (mode) {
      case ThemeMode.light:
        return _themeModes[0];
      case ThemeMode.dark:
        return _themeModes[1];
      default:
        return _themeModes[2];
    }
  }
}