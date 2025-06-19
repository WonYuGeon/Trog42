import 'package:flutter/material.dart';

// 1. Light Theme을 위한 ColorScheme 정의
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFDDDDDD),
  onPrimary: Color(0xFF000000), // Primary 색상 위에 표시될 콘텐츠(텍스트, 아이콘) 색상
  secondary: Color(0xFFCCCCCC), // 보조 색상 (필터 칩, 플로팅 액션 버튼 등)
  onSecondary: Color(0xFF111111), // Secondary 색상 위에 표시될 콘텐츠 색상
  error: Color(0xFFB3261E), // 에러 표시를 위한 색상
  onError: Color(0xFFFFFFFF), // Background 색상 위에 표시될 콘텐츠 색상
  surface: Color(0xFFFFFBFE), // 카드, 다이얼로그, 시트 등의 표면 색상
  onSurface: Color(0xFF1C1B1F), // Surface 색상 위에 표시될 콘텐츠 색상
);

// 2. Dark Theme을 위한 ColorScheme 정의
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF222222), // 앱의 주요 색상 (버튼, 활성 상태 등)
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF333333),
  onSecondary: Color(0xFFEEEEEE),
  error: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
);

// 3. ThemeData 객체 생성
final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme, // 위에서 정의한 lightColorScheme 적용
  scaffoldBackgroundColor: lightColorScheme.primary, // Scaffold 배경색 명시
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary, // AppBar의 아이콘 및 텍스트 색상
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF1C1B1F)),
    bodyMedium: TextStyle(color: Color(0xFF49454F)),
  ),
  iconTheme: IconThemeData(color: lightColorScheme.onSurface),
  // 다른 위젯 테마들 (elevatedButtonTheme, cardTheme 등)도 여기서 정의 가능
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme, // 위에서 정의한 darkColorScheme 적용
  scaffoldBackgroundColor: darkColorScheme.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFE6E1E5)),
    bodyMedium: TextStyle(color: Color(0xFFCAC4D0)),
  ),
  iconTheme: IconThemeData(color: darkColorScheme.onSurface),
);
