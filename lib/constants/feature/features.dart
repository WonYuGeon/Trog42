import 'package:flutter_svg/svg.dart';
import 'package:trog42/constants/feature/feature_list.dart';
import 'package:trog42/constants/feature/feature_category.dart';
import 'package:trog42/models/feature/feature.dart';
import 'package:trog42/screens/etc_calculator/exchange_rate_calculator_screen.dart';
import 'package:trog42/screens/placeholder_screen.dart';

final Map<FeatureList, Feature> features = {
  // 수집
  FeatureList.myEquipment: Feature(
    category: FeatureCategoryList.collection,
    feature: FeatureList.myEquipment,
    name: "내 장착",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '내 장착'),
  ),
  FeatureList.eventCalculator: Feature(
    category: FeatureCategoryList.collection,
    feature: FeatureList.eventCalculator,
    name: "이벤트 확률 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '이벤트 확률 계산기'),
  ),
  FeatureList.customProfile: Feature(
    category: FeatureCategoryList.collection,
    feature: FeatureList.customProfile,
    name: "커스텀 프로필",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '커스텀 프로필'),
  ),
  FeatureList.customNotepad: Feature(
    category: FeatureCategoryList.collection,
    feature: FeatureList.customNotepad,
    name: "커스텀 메모장",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '커스텀 메모장'),
  ),

  // 명성
  FeatureList.dailyCompCalculator: Feature(
    category: FeatureCategoryList.fame,
    feature: FeatureList.dailyCompCalculator,
    name: "출보 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '출보 계산기'),
  ),
  FeatureList.postcardCalculator: Feature(
    category: FeatureCategoryList.fame,
    feature: FeatureList.postcardCalculator,
    name: "엽교 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '엽교 계산기'),
  ),
  FeatureList.authorityCalculator: Feature(
    category: FeatureCategoryList.fame,
    feature: FeatureList.authorityCalculator,
    name: "권엽 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '권엽 계산기'),
  ),
  FeatureList.mailboxCalculator: Feature(
    category: FeatureCategoryList.fame,
    feature: FeatureList.mailboxCalculator,
    name: "우체통 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '우체통 계산기'),
  ),

  // 기타 계산기
  FeatureList.exchangeRateCalculator: Feature(
    category: FeatureCategoryList.etcCalculator,
    feature: FeatureList.exchangeRateCalculator,
    name: "환율 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: ExchangeRateCalculatorScreen(),
  ),
  FeatureList.hitmanCalculator: Feature(
    category: FeatureCategoryList.etcCalculator,
    feature: FeatureList.hitmanCalculator,
    name: "청부업자 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '청부업자 계산기'),
  ),

  // 카드 교환소
  FeatureList.myCard: Feature(
    category: FeatureCategoryList.cardExchangeOffice,
    feature: FeatureList.myCard,
    name: "내 카드",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '내 카드'),
  ),
  FeatureList.tierCalculator: Feature(
    category: FeatureCategoryList.cardExchangeOffice,
    feature: FeatureList.tierCalculator,
    name: "티어 계산기",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '티어 계산기'),
  ),
  FeatureList.currentCardPrice: Feature(
    category: FeatureCategoryList.cardExchangeOffice,
    feature: FeatureList.currentCardPrice,
    name: "현재 카드 시세",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '현재 카드 시세'),
  ),
  FeatureList.cardReservation: Feature(
    category: FeatureCategoryList.cardExchangeOffice,
    feature: FeatureList.cardReservation,
    name: "카드 예약",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '카드 예약'),
  ),
  FeatureList.cardExchangeDetails: Feature(
    category: FeatureCategoryList.cardExchangeOffice,
    feature: FeatureList.cardExchangeDetails,
    name: "카드 거래 내역",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '카드 거래 내역'),
  ),
  FeatureList.chat: Feature(
    category: FeatureCategoryList.cardExchangeOffice,
    feature: FeatureList.chat,
    name: "채팅",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '채팅'),
  ),

  // 마피아 타자 연습
  FeatureList.introTypingPractice: Feature(
    category: FeatureCategoryList.mafiaTypingPractice,
    feature: FeatureList.introTypingPractice,
    name: "직멘 타자 연습",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '직멘 타자 연습'),
  ),
  FeatureList.ownTypingPractice: Feature(
    category: FeatureCategoryList.mafiaTypingPractice,
    feature: FeatureList.ownTypingPractice,
    name: "나만의 타자 연습",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '나만의 타자 연습'),
  ),

  // 길드 관리
  FeatureList.myGuild: Feature(
    category: FeatureCategoryList.guildManagement,
    feature: FeatureList.myGuild,
    name: "내 길드",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '내 길드'),
  ),
  FeatureList.guildCondition: Feature(
    category: FeatureCategoryList.guildManagement,
    feature: FeatureList.guildCondition,
    name: "길드 조건",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '길드 조건'),
  ),
  FeatureList.unfulfilled: Feature(
    category: FeatureCategoryList.guildManagement,
    feature: FeatureList.unfulfilled,
    name: "미달 현황",
    icon: SvgPicture.asset('assets/images/splash/trog_tongue.svg'),
    priority: 1,
    route: const PlaceholderScreen(title: '미달 현황'),
  ),
};
