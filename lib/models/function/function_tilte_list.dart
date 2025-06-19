enum FunctionTitleList {
  home,
  collection, // 수집
  fame, // 명성
  etcCalculator,
  cardExchangeOffice, // 카드 교환소
  mafiaTypingPractice, // 마피아 타자 연습
  guildManagement, // 길드 관리
}

extension FunctionTitleListExtension on FunctionTitleList {
  String get displayName {
    switch (this) {
      case FunctionTitleList.home:
        return '홈';
      case FunctionTitleList.collection:
        return '수집';
      case FunctionTitleList.fame:
        return '명성';
      case FunctionTitleList.etcCalculator:
        return '기타 계산기';
      case FunctionTitleList.cardExchangeOffice:
        return '카드 교환소';
      case FunctionTitleList.mafiaTypingPractice:
        return '마피아 타자 연습';
      case FunctionTitleList.guildManagement:
        return '길드 관리';
    }
  }
}
