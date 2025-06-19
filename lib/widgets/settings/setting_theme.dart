// lib/widgets/settings/setting_theme.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trog42/services/theme_service.dart'; // 새로 만든 서비스 import
import 'package:trog42/theme/theme_notifier.dart';

class SettingTheme extends StatelessWidget {
  const SettingTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    final themeService = ThemeService();
    final themeModes = ['라이트', '다크', '시스템'];

    // 사용자가 Dropdown에서 새로운 테마를 선택했을 때 호출되는 함수
    void onThemeChanged(String? value) {
      if (value == null) return;

      final newMode = themeService.getThemeModeFromString(value);

      // Provider를 통해 테마를 변경
      themeNotifier.setThemeMode(newMode);

      // 선택된 값을 SharedPreferences에 저장
      themeService.saveTheme(newMode);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '테마 설정',
          style: TextStyle(
            color:
                Theme.of(
                  context,
                ).colorScheme.onSurface, // onPrimary 대신 onSurface
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          underline: const SizedBox(), // Center() 대신 const SizedBox()
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          // ✨ 현재 테마를 ThemeNotifier로부터 직접 받아와 UI에 표시
          value: themeService.getStringFromThemeMode(themeNotifier.themeMode),
          items:
              themeModes
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: onThemeChanged,
        ),
      ],
    );
  }
}
