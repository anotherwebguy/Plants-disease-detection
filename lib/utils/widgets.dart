import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plantdiseasedetector/utils/colors.dart';
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
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}

Widget text2(var text,
    {var fontSize = 18.0,
    textColor = const Color(0xFF838591),
    var fontFamily = 'Regular',
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.1,
    overflow: Overflow}) {
  return Text(text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
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


BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color bgColor = Colors.white, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor,
    boxShadow: showShadow ? [BoxShadow(color: shadowColorGlobal, blurRadius: 5, spreadRadius: 1)] : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}



void showErrorProcessing(BuildContext context) {
  AlertDialog dialogWithImage = AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 120, color: t5DarkNavy),
                Column(
                  children: [
                    Icon(Icons.warning, color: white, size: 32),
                    8.height,
                    Text('OOPs...', textAlign: TextAlign.center, style: boldTextStyle(color: white, size: 18)),
                  ],
                )
              ],
            ),
            30.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text("We encountered a issue while processing!\nTip: Please make sure you take the image up close and with proper lighting.", style: secondaryTextStyle()),
            ),
            16.height,
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: boxDecoration(bgColor: t5DarkNavy, radius: 10),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: text("Try again", textColor: white, fontSize: 16.0),
              ),
            ),
            16.height,
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );
  showDialog(
      context: context, builder: (BuildContext context) => dialogWithImage);
}

