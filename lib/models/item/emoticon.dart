import 'package:trog42/models/item/equipment.dart';

class Emoticon extends Equipment {
  final Type type = Type.emoticon;
  Emoticon({
    required super.name,
    required super.image,
    required super.collectionPoint,
  });
}
