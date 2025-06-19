import 'package:trog42/models/item/equipment.dart';

class Balloon extends Equipment {
  final Type type = Type.balloon;
  Balloon({
    required super.name,
    required super.image,
    required super.collectionPoint,
  });
}
