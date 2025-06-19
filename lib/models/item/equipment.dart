import 'package:trog42/models/item/item.dart';

class Equipment extends Item {
  final int _collectionPoint;

  Equipment({
    required super.name,
    required super.image,
    required int collectionPoint,
  }) : _collectionPoint = collectionPoint;

  int get collectionPoint => _collectionPoint;
}

enum Type {
  skin,
  nametag,
  frame,
  wallet,
  emoticon,
  balloon,
}
