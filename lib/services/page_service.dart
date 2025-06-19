import 'package:shared_preferences/shared_preferences.dart';

class PageService {
  final String _tag = 'lastPageIndex';

  Future<void> saveLastPageIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_tag, index);
  }

  // 저장된 마지막 페이지 인덱스를 불러오는 함수
  Future<int> getLastPageIndex() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_tag) ?? 0;
  }
}
