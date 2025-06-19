import 'package:flutter/material.dart';
import 'package:trog42/screens/home_screen.dart'; // 예시: 뒤로가기 시 이동할 화면
import 'package:trog42/widgets/settings/setting_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar를 투명하게 만들어 아이콘, 타이틀 배치를 쉽게 합니다.
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 배경을 투명하게 설정
        elevation: 0, // 그림자 제거
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            // 현재 화면을 닫고 이전 화면으로 돌아갑니다.
            Navigator.pop(context);
          },
        ),
        title: Text(
          '설정',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // 제목을 중앙에 배치
      ),
      // 2. body가 AppBar의 영역 뒤까지 확장되도록 설정합니다.
      extendBodyBehindAppBar: true,
      // 3. Stack을 사용하여 위젯들을 겹칩니다.
      body: Stack(
        children: [
          // 배경 레이어: 헤더 영역의 배경색을 담당합니다.
          Container(
            // 원하는 만큼 헤더 배경의 높이를 조절합니다.
            height: 200,
            color: Theme.of(context).colorScheme.secondary,
          ),
          // 콘텐츠 레이어: 둥근 모서리를 가진 메인 콘텐츠입니다.
          Padding(
            // AppBar의 높이(kToolbarHeight)와 상태바 높이를 고려하여
            // 콘텐츠가 시작될 위치를 지정합니다.
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight,
            ),
            child: Container(
              // 남은 공간을 모두 채웁니다.
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                // ✨ 요구사항: 두 번째 Flexible의 borderRadius를 그대로 유지
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: const [
                    SettingTheme(),
                    // 다른 설정 위젯들을 여기에 추가
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
