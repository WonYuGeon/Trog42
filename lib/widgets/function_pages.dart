import 'package:flutter/material.dart';
import 'package:trog42/models/function_list.dart';
import 'package:trog42/models/function_tilte_list.dart';
import 'package:trog42/widgets/function_card_view.dart';

class FunctionPages extends StatefulWidget {
  const FunctionPages({super.key});

  @override
  State<FunctionPages> createState() => _FunctionPagesState();
}

class _FunctionPagesState extends State<FunctionPages> {
  late PageController _pageController;
  double _currentPage = 0;

  // ✨ 1. [수정] title과 function을 쌍으로 저장할 리스트 선언
  List<MapEntry<FunctionTitleList, FunctionList>> functionEntries = [];

  Future<void> initFunctionList() async {
    // 임시 리스트 생성
    List<MapEntry<FunctionTitleList, FunctionList>> entries = [];
    final allTitles = items.keys.toList();

    for (var title in allTitles) {
      for (var function in items[title]!) {
        // ✨ 2. [수정] '홈' 기능은 렌더링 목록에서 제외
        if (function == FunctionList.home) {
          continue;
        }
        entries.add(MapEntry(title, function));
      }
    }
    // State 업데이트
    setState(() {
      functionEntries = entries;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7)..addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
    initFunctionList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;

          return PageView.builder(
            controller: _pageController,
            itemCount: functionEntries.length,
            itemBuilder: (context, index) {
              double scale = (1 - ((_currentPage - index).abs() * 0.3)).clamp(
                0.8,
                1.0,
              );

              final entry = functionEntries[index];

              return FunctionPage(
                scale: scale,
                maxWidth: maxWidth,
                title: entry.key,
                function: entry.value,
              );
            },
          );
        },
      ),
    );
  }
}

class FunctionPage extends StatelessWidget {
  const FunctionPage({
    super.key,
    required this.scale,
    required this.maxWidth,
    required this.title,
    required this.function,
  });

  final double scale;
  final double maxWidth;
  final FunctionTitleList title;
  final FunctionList function;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FunctionCard(width: maxWidth * 0.6, height: maxWidth * 0.6 * 1.5),
          const SizedBox(height: 10),
          Text(
            function.displayName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title.displayName,
            style: TextStyle(
              color: Theme.of(
                context,
              ).colorScheme.onPrimary.withValues(alpha: 0.5),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
