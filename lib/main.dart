/* lib/main.dart */
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:trog42/screens/home_screen.dart';
import 'package:trog42/services/theme_service.dart';
import 'package:trog42/theme/theme.dart';
import 'package:trog42/theme/theme_notifier.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final savedThemeMode = await ThemeService().loadTheme();

  runApp(
    ChangeNotifierProvider(
      // ✨ 불러온 테마로 ThemeNotifier를 초기화합니다.
      create: (_) => ThemeNotifier(initialThemeMode: savedThemeMode),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider를 통해 ThemeNotifier의 상태를 감시
    final themeNotifier = context.watch<ThemeNotifier>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // MaterialApp 테마 설정
      theme: lightTheme, // 라이트 모드일 때 적용될 테마
      darkTheme: darkTheme, // 다크 모드일 때 적용될 테마
      themeMode: themeNotifier.themeMode, // 현재 테마 모드 (system, light, dark)
      home: const HomeScreen(),
    );
  }
}
