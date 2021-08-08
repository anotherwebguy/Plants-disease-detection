import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:plantdiseasedetector/utils/constants.dart';

Widget text(var text,
    {var fontSize = textSizeLargeMedium,
    textColor = const Color(0XFF747474),
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.5}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}

Widget text1(
    String text, {
          var fontSize = 14.0,
          textColor = const Color(0xFF212121),
          var fontFamily = 'Regular',
          var isCentered = false,
          var maxLine = 1,
          var latterSpacing = 0.25,
          var textAllCaps = false,
          var isLongText = false,
    }) {
      return Text(textAllCaps ? text.toUpperCase() : text,
          textAlign: isCentered ? TextAlign.center : TextAlign.start,
          maxLines: isLongText ? null : maxLine,
          style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: textColor, height: 1.5, letterSpacing: latterSpacing));
}

Widget text2(var text,
    {var fontSize = 18.0, textColor =const Color(0xFF838591), var fontFamily = 'Regular', var isCentered = false, var maxLine = 1, var latterSpacing = 0.1, overflow: Overflow}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      style: TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: textColor, height: 1.5, letterSpacing: latterSpacing));
}

changeStatusColor(Color color) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        useWhiteForeground(color));
  } on Exception catch (e) {
    print(e);
  }
}