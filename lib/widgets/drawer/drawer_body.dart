import 'package:flutter/material.dart';
import 'package:trog42/services/feature_category_service.dart';
import 'package:trog42/widgets/drawer/drawer_expandable_list.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final featuresByCategory = FeatureCategoryService.getFeaturesByCategory();

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        scrollDirection: Axis.vertical,
        itemCount: featuresByCategory.length,
        itemBuilder: (context, index) {
          final entry = featuresByCategory.entries.elementAt(index);
          final category = entry.key; // 예: FeatureTypeList.collection
          final features = entry.value;

          return DrawerExpandableList(category: category, features: features);
        },
        separatorBuilder: (context, index) => const Divider(height: 0.5),
      ),
    );
  }
}
