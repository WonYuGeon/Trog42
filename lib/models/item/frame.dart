import 'package:trog42/models/item/equipment.dart';

class Frame extends Equipment {
  final Type type = Type.frame;
  Frame({
    required super.name,
    required super.image,
    required super.collectionPoint,
  });
}
