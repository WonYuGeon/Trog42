import 'package:trog42/models/item/equipment.dart';

class Wallet extends Equipment {
  final Type type = Type.wallet;
  Wallet({
    required super.name,
    required super.image,
    required super.collectionPoint,
  });
}
