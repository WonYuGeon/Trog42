import 'package:trog42/models/function_tilte_list.dart';

enum FunctionList {
  home,
  myCard, // 내 카드
  currentCardPrice, // 현재 카드 시세
  cardReservation, // 카드 예약
  cardExchangeDetails, // 카드 거래 내역
  chat, // 채팅 (거래용)
  introTypingPractice, // 직멘 타자 연습
  ownTypingPractice, // 나만의 타자 연습
  myGuild, // 내 길드
  guildCondition, // 길조
  unfulfilled, // 미달
  //---------------이후 추가 가능--------------
}

extension FunctionListExtension on FunctionList {
  String get displayName {
    switch (this) {
      case FunctionList.home:
        return '홈';
      case FunctionList.myCard:
        return '내 카드';
      case FunctionList.currentCardPrice:
        return '현재 카드 시세';
      case FunctionList.cardReservation:
        return '카드 예약';
      case FunctionList.cardExchangeDetails:
        return '카드 거래 내역';
      case FunctionList.chat:
        return '채팅';
      case FunctionList.introTypingPractice:
        return '직멘 타자 연습';
      case FunctionList.ownTypingPractice:
        return '나만의 타자 연습';
      case FunctionList.myGuild:
        return '내 길드';
      case FunctionList.guildCondition:
        return '길드 조건';
      case FunctionList.unfulfilled:
        return '미달 현황';
    }
  }
}

final Map<FunctionTitleList, List<FunctionList>> items = {
  FunctionTitleList.home: [FunctionList.home],
  FunctionTitleList.cardExchangeOffice: [
    FunctionList.myCard,
    FunctionList.currentCardPrice,
    FunctionList.cardReservation,
    FunctionList.cardExchangeDetails,
    FunctionList.chat,
  ],
  FunctionTitleList.mafiaTypingPractice: [
    FunctionList.introTypingPractice,
    FunctionList.ownTypingPractice,
  ],
  FunctionTitleList.guildManagement: [
    FunctionList.myGuild,
    FunctionList.guildCondition,
    FunctionList.unfulfilled,
  ],
};
