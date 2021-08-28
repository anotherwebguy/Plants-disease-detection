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

void showErrorProcessing(BuildContext context) {
  Dialog dialogWithImage = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Container(
      height: 410.0,
      width: 300.0,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text(
              "We encountered a issue while processing!\nTip: Please make sure you take the image up close and with proper lighting.",
              style: TextStyle(
                  fontFamily: "Regular",
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            height: 200,
            width: 300,
            child: Image.asset(
              'assets/oops.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    ),
  );
  showDialog(
      context: context, builder: (BuildContext context) => dialogWithImage);
}

