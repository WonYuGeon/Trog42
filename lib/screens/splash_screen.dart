import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trog42/screens/home_screen.dart';
import 'package:trog42/theme/theme_checker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // 애니메이션 제어 컨트롤러
  late Animation<double> _animation; // 애니메이션 값(0~1) 생성 Tween

  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 초기화
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // 애니메이션 효과 설정
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    // 애니메이션 시작
    _controller.forward();

    // 애니메이션 종료 후 다음 화면 이동
    Timer(const Duration(seconds: 100), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 1, child: Container()),
          Flexible(
            flex: 3,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double trogSize = constraints.maxWidth * 0.7;
                log(trogSize.toString());
                final double tongueWidth = trogSize * 0.07;
                log(tongueWidth.toString());
            
                final double tongueTop = trogSize * 0.417;
                log(tongueTop.toString());
                final double tongueLeft = (trogSize - tongueWidth) / 2;
                log(tongueLeft.toString());
            
                return Center(
                  child: Transform.translate(
                    offset: Offset(0, -tongueTop / 3),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // 개구리 혀
                        Positioned(
                          top: tongueTop,
                          left: tongueLeft,
                          child: ClipRect(
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(
                                    0,
                                    -tongueTop * (1 - _animation.value),
                                  ),
                                  child: child,
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/images/splash/trog_tongue.svg',
                                width: tongueWidth,
                              ),
                            ),
                          ),
                        ),
                        // 개구리 몸통
                        SvgPicture.asset(
                          ThemeChecker.isLightMode(context)
                              ? 'assets/images/splash/trog_body_light_theme.svg'
                              : 'assets/images/splash/trog_body_dark_theme.svg',
                          width: trogSize,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Flexible(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
