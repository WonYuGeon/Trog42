import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trog42/models/function/function_tilte_list.dart';
import 'package:trog42/screens/placeholder_screen.dart';

enum FunctionList {
  home,
  myEquipment, // 내 장착
  eventCalculator, // 이벤트 확률 계산기
  customProfile, // 커스텀 프로필
  customNotepad, // 커스텀 메모장
  dailyCompCalculator, // 출보 계산기
  postcardCalculator, // 엽교 계산기
  authorityCalculator, // 권엽 계산기
  mailboxCalculator, // 우체통 계산기
  exchangeRateCalculator, // 환율 계산기
  hitmanCalculator,
  myCard, // 내 카드
  tierCalculator, // 티어 계산기
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
      case FunctionList.myEquipment:
        return '내 장착';
      case FunctionList.eventCalculator:
        return '이벤트 확률 계산기';
      case FunctionList.customProfile:
        return '커스텀 프로필';
      case FunctionList.customNotepad:
        return '커스텀 메모장';
      case FunctionList.dailyCompCalculator:
        return '출보 계산기';
      case FunctionList.postcardCalculator:
        return '엽교 계산기';
      case FunctionList.authorityCalculator:
        return '권엽 계산기';
      case FunctionList.mailboxCalculator:
        return '우체통 계산기';
      case FunctionList.exchangeRateCalculator:
        return '환율 계산기';
      case FunctionList.hitmanCalculator:
        return '청부업자 계산기';
      case FunctionList.myCard:
        return '내 카드';
      case FunctionList.tierCalculator:
        return '티어 계산기';
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
      case FunctionList.myEquipment:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.eventCalculator:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.customProfile:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.customNotepad:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.dailyCompCalculator:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.postcardCalculator:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.authorityCalculator:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.mailboxCalculator:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.exchangeRateCalculator:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.hitmanCalculator:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.myCard:
        return SvgPicture.asset('assets/images/splash/trog_tongue.svg');
      case FunctionList.tierCalculator:
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
  FunctionTitleList.collection: [
    FunctionList.myEquipment,
    FunctionList.eventCalculator,
    FunctionList.customProfile,
    FunctionList.customNotepad,
  ],
  FunctionTitleList.fame: [
    FunctionList.dailyCompCalculator,
    FunctionList.postcardCalculator,
    FunctionList.authorityCalculator,
    FunctionList.mailboxCalculator,
  ],
  FunctionTitleList.etcCalculator: [
    FunctionList.exchangeRateCalculator,
    FunctionList.hitmanCalculator,
  ],
  FunctionTitleList.cardExchangeOffice: [
    FunctionList.myCard,
    FunctionList.tierCalculator,
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
  // 수집
  FunctionList.myEquipment: const PlaceholderScreen(title: '내 장착'),
  FunctionList.eventCalculator: const PlaceholderScreen(title: '이벤트 확률 계산기'),
  FunctionList.customProfile: const PlaceholderScreen(title: '커스텀 프로필'),
  FunctionList.customNotepad: const PlaceholderScreen(title: '커스텀 메모장'),

  // 명성
  FunctionList.dailyCompCalculator: const PlaceholderScreen(title: '출보 계산기'),
  FunctionList.postcardCalculator: const PlaceholderScreen(title: '엽교 계산기'),
  FunctionList.authorityCalculator: const PlaceholderScreen(title: '권엽 계산기'),
  FunctionList.mailboxCalculator: const PlaceholderScreen(title: '우체통 계산기'),

  // 기타 계산기
  FunctionList.exchangeRateCalculator: const PlaceholderScreen(title: '환율 계산기'),
  FunctionList.hitmanCalculator: const PlaceholderScreen(title: '청부업자 계산기'),

  // 카드 교환소
  FunctionList.myCard: const PlaceholderScreen(title: '내 카드'),
  FunctionList.tierCalculator: const PlaceholderScreen(title: '티어 계산기'),
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
