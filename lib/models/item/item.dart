import 'dart:ui';

class Item {
  final String _name;
  final Image _image;

  Item({required String name, required Image image})
    : _image = image,
      _name = name;

  String get name => _name;
  Image get image => _image;
}
