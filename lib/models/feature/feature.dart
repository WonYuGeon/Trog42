import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trog42/constants/feature/feature_list.dart';
import 'package:trog42/constants/feature/feature_category.dart';

class Feature {
  final FeatureCategoryList _category;
  final FeatureList _feature;
  final String _name;
  final SvgPicture _icon;
  final int _priority;
  final Widget _route;

  Feature({
    required FeatureCategoryList category,
    required FeatureList feature,
    required String name,
    required SvgPicture icon,
    required int priority,
    required Widget route,
  }) : _category = category,
       _feature = feature,
       _name = name,
       _icon = icon,
       _priority = priority,
       _route = route;

  FeatureCategoryList get category => _category;
  FeatureList get feature => _feature;
  String get name => _name;
  SvgPicture get icon => _icon;
  int get priority => _priority;
  Widget get route => _route;
}
