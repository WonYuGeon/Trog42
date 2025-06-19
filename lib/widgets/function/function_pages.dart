import 'package:flutter/material.dart';
import 'package:trog42/models/function/function_list.dart';
import 'package:trog42/models/function/function_tilte_list.dart';
import 'package:trog42/services/page_service.dart'; // ✨ 1. PageService import
import 'package:trog42/widgets/function/function_page.dart';

class FunctionPages extends StatefulWidget {
  const FunctionPages({super.key});

  @override
  State<FunctionPages> createState() => _FunctionPagesState();
}

class _FunctionPagesState extends State<FunctionPages> {
  // ✨ 2. Future<int> 타입으로 페이지 인덱스를 선언합니다.
  late Future<int> _initialPageIndexFuture;

  List<MapEntry<FunctionTitleList, FunctionList>> functionEntries = [];

  // 이 함수는 그대로 유지합니다.
  Future<void> initFunctionList() async {
    List<MapEntry<FunctionTitleList, FunctionList>> entries = [];
    final allTitles = items.keys.toList();

    for (var title in allTitles) {
      for (var function in items[title]!) {
        if (function == FunctionList.home) {
          continue;
        }
        entries.add(MapEntry(title, function));
      }
    }
    setState(() {
      functionEntries = entries;
    });
  }

  @override
  void initState() {
    super.initState();
    // ✨ 3. initState에서 SharedPreferences를 호출하는 Future를 생성합니다.
    _initialPageIndexFuture = PageService().getLastPageIndex();
    initFunctionList();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      // ✨ 4. FutureBuilder를 사용하여 비동기 데이터를 안전하게 처리합니다.
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

          // ✨ 5. 데이터를 성공적으로 불러왔을 때 PageView를 그립니다.
          // snapshot.data는 null이 아닌 int 값을 가집니다.
          final initialIndex = snapshot.data ?? 0;

          return FunctionPagesView(
            // Key를 주어 FutureBuilder가 재실행될 때 상태를 유지하도록 합니다.
            key: ValueKey(initialIndex),
            initialIndex: initialIndex,
            functionEntries: functionEntries,
          );
        },
      ),
    );
  }
}

// --- 실제 PageView 로직을 별도의 StatefulWidget으로 분리 ---
// 이렇게 하면 PageController의 생명주기를 안전하게 관리할 수 있습니다.

class FunctionPagesView extends StatefulWidget {
  final int initialIndex;
  final List<MapEntry<FunctionTitleList, FunctionList>> functionEntries;

  const FunctionPagesView({
    super.key,
    required this.initialIndex,
    required this.functionEntries,
  });

  @override
  State<FunctionPagesView> createState() => _FunctionPagesViewState();
}

class _FunctionPagesViewState extends State<FunctionPagesView> {
  late PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.7,
      // FutureBuilder로부터 전달받은 안전한 int 값을 사용합니다.
      initialPage: widget.initialIndex,
    );
    _currentPage = widget.initialIndex.toDouble();

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
          itemCount: widget.functionEntries.length,
          // 페이지가 바뀔 때마다 인덱스를 저장합니다.
          onPageChanged: (index) {
            PageService().saveLastPageIndex(index);
          },
          itemBuilder: (context, index) {
            if (widget.functionEntries.isEmpty) {
              return const SizedBox.shrink();
            }
            final scale = (1 - ((_currentPage - index).abs() * 0.3)).clamp(
              0.8,
              1.0,
            );
            final entry = widget.functionEntries[index];

            return FunctionPage(
              scale: scale,
              maxWidth: maxWidth,
              title: entry.key,
              function: entry.value,
            );
          },
        );
      },
    );
  }
}
