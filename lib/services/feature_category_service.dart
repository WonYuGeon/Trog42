import 'package:trog42/constants/feature/feature_category.dart';
import 'package:trog42/constants/feature/features.dart';
import 'package:trog42/models/feature/feature.dart';

class FeatureCategoryService {
  static Map<FeatureCategoryList, List<Feature>> getFeaturesByCategory() {
    return features.values.fold(<FeatureCategoryList, List<Feature>>{}, (
      map,
      feature,
    ) {
      map.putIfAbsent(feature.category, () => []).add(feature);
      return map;
    });
  }

  static Map<int, List<Feature>> getFeaturesByIndex() {
    return features.values.fold(<int, List<Feature>>{}, (map, feature) {
      map.putIfAbsent(feature.category.index, () => []).add(feature);
      return map;
    });
  }
}
