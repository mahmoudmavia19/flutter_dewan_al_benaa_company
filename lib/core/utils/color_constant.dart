import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray400 = fromHex('#74839d');

  static Color blueA700 = fromHex('#0061ff');

  static Color blueGray900 = fromHex('#262b35');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray50 = fromHex('#f9fbff');

  static Color blue50 = fromHex('#e0ebff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
