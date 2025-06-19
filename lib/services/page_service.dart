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

    // ✨ [핵심 수정] `?? 0` 을 반드시 추가해주세요.
    // SharedPreferences에서 불러온 값이 null일 경우, 기본값으로 0을 반환합니다.
    // 이렇게 하면 이 함수는 절대 null을 반환하지 않게 됩니다.
    return prefs.getInt(_tag) ?? 0;
  }
}
