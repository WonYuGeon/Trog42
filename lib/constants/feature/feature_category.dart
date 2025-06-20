enum FeatureCategoryList {
  home,
  collection, // 수집
  fame, // 명성
  etcCalculator,
  cardExchangeOffice, // 카드 교환소
  mafiaTypingPractice, // 마피아 타자 연습
  guildManagement, // 길드 관리
}

extension FeatureCategoryListExtension on FeatureCategoryList {
  String get displayName {
    switch (this) {
      case FeatureCategoryList.home:
        return '홈';
      case FeatureCategoryList.collection:
        return '수집';
      case FeatureCategoryList.fame:
        return '명성';
      case FeatureCategoryList.etcCalculator:
        return '기타 계산기';
      case FeatureCategoryList.cardExchangeOffice:
        return '카드 교환소';
      case FeatureCategoryList.mafiaTypingPractice:
        return '마피아 타자 연습';
      case FeatureCategoryList.guildManagement:
        return '길드 관리';
    }
  }
}
