import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color teal300 = fromHex('#4d9ecc');

  static Color bluegray700 = fromHex('#3d5980');

  static Color lightBlue10033 = fromHex('#33a3d9f2');

  static Color indigo200 = fromHex('#99c2d9');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color bluegray800 = fromHex('#2e384d');

  static Color gray400 = fromHex('#bdbdbd');

  static Color bluegray600 = fromHex('#387a96');

  static Color black90026 = fromHex('#26000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}