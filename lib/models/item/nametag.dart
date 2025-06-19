import 'package:trog42/models/item/equipment.dart';

class Nametag extends Equipment {
  final Type type = Type.nametag;
  Nametag({
    required super.name,
    required super.image,
    required super.collectionPoint,
  });
}
