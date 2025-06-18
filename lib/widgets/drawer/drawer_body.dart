import 'package:flutter/material.dart';
import 'package:trog42/models/function_list.dart';
import 'package:trog42/widgets/drawer/drawer_expandable_list.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({super.key});

  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    final titles = items.keys.toList();

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final title = titles[index];
          final functions = items[title]!;

          // ✨ 복잡한 UI 로직 대신, 상태를 스스로 관리하는 위젯을 사용
          return DrawerExpandableList(title: title, functions: functions);
        },
        separatorBuilder: (context, index) => const Divider(height: 0.5),
        itemCount: titles.length,
      ),
    );
  }
}
