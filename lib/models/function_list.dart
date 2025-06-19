import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trog42/models/function_tilte_list.dart';
import 'package:trog42/screens/placeholder_screen.dart';

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

  SvgPicture? get icon {
    switch (this) {
      case FunctionList.home:
        return null;
      case FunctionList.myCard:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.currentCardPrice:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.cardReservation:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.cardExchangeDetails:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.chat:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.introTypingPractice:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.ownTypingPractice:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.myGuild:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.guildCondition:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.unfulfilled:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
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

final Map<FunctionList, Widget> routes = {
  // 카드 교환소
  FunctionList.myCard: const PlaceholderScreen(title: '내 카드'),
  FunctionList.currentCardPrice: const PlaceholderScreen(title: '현재 카드 시세'),
  FunctionList.cardReservation: const PlaceholderScreen(title: '카드 예약'),
  FunctionList.cardExchangeDetails: const PlaceholderScreen(title: '카드 거래 내역'),
  FunctionList.chat: const PlaceholderScreen(title: '채팅'),
  
  // 마피아 타자 연습
  FunctionList.introTypingPractice: const PlaceholderScreen(title: '직멘 타자 연습'),
  FunctionList.ownTypingPractice: const PlaceholderScreen(title: '나만의 타자 연습'),

  // 길드 관리
  FunctionList.myGuild: const PlaceholderScreen(title: '내 길드'),
  FunctionList.guildCondition: const PlaceholderScreen(title: '길드 조건'),
  FunctionList.unfulfilled: const PlaceholderScreen(title: '미달 현황'),

  // home은 FunctionPages에서 렌더링되지 않으므로 맵에 포함하지 않습니다.
};
