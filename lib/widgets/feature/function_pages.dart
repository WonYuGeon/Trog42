import 'package:flutter/material.dart';
import 'package:trog42/constants/feature/features.dart';
import 'package:trog42/models/feature/feature.dart';
import 'package:trog42/services/page_service.dart';
import 'package:trog42/widgets/feature/function_page.dart';

class FunctionPages extends StatefulWidget {
  const FunctionPages({super.key});

  @override
  State<FunctionPages> createState() => _FunctionPagesState();
}

class _FunctionPagesState extends State<FunctionPages> {
  late Future<int> _initialPageIndexFuture;

  @override
  void initState() {
    super.initState();
    _initialPageIndexFuture = PageService().getLastPageIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: FutureBuilder<int>(
        future: _initialPageIndexFuture, // 위에서 만든 Future를 사용
        builder: (context, snapshot) {
          // 데이터 로딩 중일 때
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 에러가 발생했을 때 (네트워크 오류 등)
          if (snapshot.hasError) {
            return Center(child: Text('페이지를 불러오지 못했습니다: ${snapshot.error}'));
          }

          final initialIndex = snapshot.data ?? 0;

          return FunctionPagesView(
            key: ValueKey(initialIndex),
            initialIndex: initialIndex,
          );
        },
      ),
    );
  }
}

class FunctionPagesView extends StatefulWidget {
  final int initialIndex;

  const FunctionPagesView({super.key, required this.initialIndex});

  @override
  State<FunctionPagesView> createState() => _FunctionPagesViewState();
}

class _FunctionPagesViewState extends State<FunctionPagesView> {
  late PageController _pageController;
  double _currentPage = 0.0;

  late final List<Feature> featureList;

  @override
  void initState() {
    super.initState();

    featureList = features.values.toList();

    final validInitialIndex = widget.initialIndex.clamp(
      0,
      featureList.length - 1,
    );

    _pageController = PageController(
      viewportFraction: 0.7,
      // FutureBuilder로부터 전달받은 안전한 int 값을 사용합니다.
      initialPage: validInitialIndex,
    );
    _currentPage = validInitialIndex.toDouble();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        return PageView.builder(
          controller: _pageController,
          itemCount: featureList.length,
          // 페이지가 바뀔 때마다 인덱스를 저장합니다.
          onPageChanged: (index) {
            PageService().saveLastPageIndex(index);
          },
          itemBuilder: (context, index) {
            if (featureList.isEmpty) {
              return const SizedBox.shrink();
            }
            final feature = featureList[index];
            final scale = (1 - ((_currentPage - index).abs() * 0.3)).clamp(
              0.8,
              1.0,
            );

            return FunctionPage(
              scale: scale,
              maxWidth: maxWidth,
              feature: feature,
            );
          },
        );
      },
    );
  }
}
