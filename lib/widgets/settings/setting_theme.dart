import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trog42/theme/theme_notifier.dart';

class SettingTheme extends StatefulWidget {
  const SettingTheme({super.key});

  @override
  State<SettingTheme> createState() => _SettingThemeState();
}

class _SettingThemeState extends State<SettingTheme> {
  final tag = 'selectedThemeMode';
  late SharedPreferences prefs;

  final _themeModes = ['라이트', '다크', '시스템'];
  late String _selectedTheme;

  // 초기화 로직이 한 번만 실행되도록 보장하는 플래그입니다.
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    _selectedTheme = _themeModes[2];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _isInit 플래그를 사용하여 이 로직이 한 번만 실행되도록 합니다.
    if (_isInit) {
      _initTheme();
    }
    _isInit = false;
  }

  // 테마를 초기화하는 비동기 함수
  Future<void> _initTheme() async {
    prefs = await SharedPreferences.getInstance();
    // 저장된 테마 설정을 불러옵니다.
    final savedTheme = prefs.getString(tag);

    ThemeMode currentMode;
    String currentThemeName;

    if (savedTheme != null) {
      // 저장된 값이 있으면 그 값을 현재 테마로 설정합니다.
      currentThemeName = savedTheme;
      switch (savedTheme) {
        case '라이트':
          currentMode = ThemeMode.light;
          break;
        case '다크':
          currentMode = ThemeMode.dark;
          break;
        default:
          currentMode = ThemeMode.system;
          break;
      }
    } else {
      // 저장된 값이 없으면 '시스템'을 기본값으로 설정하고 저장합니다.
      currentThemeName = _themeModes[2];
      currentMode = ThemeMode.system;
      await prefs.setString(tag, currentThemeName);
    }

    // Provider를 통해 앱의 전체 테마를 업데이트합니다.
    if (mounted) {
      // 위젯이 여전히 마운트 상태인지 확인합니다.
      context.read<ThemeNotifier>().setThemeMode(currentMode);
      // 화면의 DropdownButton UI를 업데이트합니다.
      setState(() {
        _selectedTheme = currentThemeName;
      });
    }
  }

  // 사용자가 Dropdown에서 새로운 테마를 선택했을 때 호출되는 함수
  void _onThemeChanged(String? value) async {
    if (value == null) return;

    setState(() {
      _selectedTheme = value;
    });

    ThemeMode mode;
    switch (_selectedTheme) {
      case '라이트':
        mode = ThemeMode.light;
        break;
      case '다크':
        mode = ThemeMode.dark;
        break;
      default:
        mode = ThemeMode.system;
        break;
    }
    // Provider를 통해 테마를 변경합니다.
    context.read<ThemeNotifier>().setThemeMode(mode);
    // 선택된 값을 SharedPreferences에 저장합니다.
    await prefs.setString(tag, _selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '테마 설정',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton(
          underline: Center(),
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          value: _selectedTheme,
          items:
              _themeModes
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
          onChanged: _onThemeChanged,
        ),
      ],
    );
  }
}
