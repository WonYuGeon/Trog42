import 'package:flutter/material.dart';
import 'package:animated_visibility/animated_visibility.dart';
import 'package:trog42/models/function/function_list.dart';
import 'package:trog42/models/function/function_tilte_list.dart';
import 'package:trog42/screens/home_screen.dart';

class DrawerExpandableList extends StatefulWidget {
  final FunctionTitleList title;
  final List<FunctionList> functions;

  const DrawerExpandableList({
    super.key,
    required this.title,
    required this.functions,
  });

  @override
  State<DrawerExpandableList> createState() => _DrawerExpandableListState();
}

class _DrawerExpandableListState extends State<DrawerExpandableList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool canExpand = widget.functions.length > 1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 제목과 화살표 아이콘 부분
        ListTile(
          title: Text(
            widget.title.displayName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing:
              canExpand
                  ? AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0.0, // 90도 회전
                    duration: const Duration(milliseconds: 400),
                    child: Icon(
                      Icons.arrow_right_rounded,
                      size: 35,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                  : null,
          onTap: () {
            if (canExpand) {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }
          },
        ),
        // ✨ 애니메이션 효과가 수정된 부분 ✨
        ClipRect(
          // 👈 1. 겹침 문제를 해결하기 위해 ClipRect 추가
          child: AnimatedVisibility(
            visible: _isExpanded,
            exitDuration: const Duration(milliseconds: 400),
            // 나타날 때: 공간이 확장되면서 위에서 아래로 미끄러져 내려옴
            enter:
                expandVertically(
                  curve: Curves.easeInOutCubic, // 👈 3. 더 부드러운 곡선으로 변경
                ) +
                slideInVertically(
                  initialOffsetY: -1.0,
                  curve: Curves.easeInOutCubic,
                ),
            // 사라질 때: 공간이 축소되면서 아래에서 위로 미끄러져 올라감
            exit:
                shrinkVertically(curve: Curves.easeInOutCubic) +
                slideOutVertically(
                  targetOffsetY: -1.0,
                  curve: Curves.easeInOutCubic,
                ),
            child: Container(
              // color: Colors.black.withValues(alpha: 0.15),
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Column(
                children:
                    widget.functions.map((func) {
                      return ListTile(
                        dense: true,
                        title: Text(
                          func.displayName,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.8),
                          ),
                        ),
                        onTap: () {
                          final Widget? destination = routes[func];
                          if (destination != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => destination,
                              ),
                            );
                          }
                        },
                      );
                    }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
