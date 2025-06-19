import 'package:trog42/models/item/equipment.dart';

class Skin extends Equipment {
  final Type type = Type.skin;
  Skin({
    required super.name,
    required super.image,
    required super.collectionPoint,
  });
}
