import 'package:flutter/material.dart';
import 'package:plantdiseasedetector/models/apimodel.dart';
import 'package:plantdiseasedetector/utils/colors.dart';
import 'package:plantdiseasedetector/utils/planthealththeme.dart';
import 'package:plantdiseasedetector/utils/waiveview.dart';

class MoistureView extends StatefulWidget {
  Conditions moist;
  MoistureView({this.moist});
  @override
  _MoistureViewState createState() => _MoistureViewState();
}

class _MoistureViewState extends State<MoistureView> {
  var time = "yesterday";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.moist.value);
    if(int.parse(widget.moist.value)>=80){
      time = DateTime.now().toString().substring(0,6);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: FitnessAppTheme.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: FitnessAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          child: Row(children: [
            Expanded(
                child: Column(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 3),
                          child: Text(
                            'Moisture',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: FitnessAppTheme.nearlyDarkBlue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(
                            '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              letterSpacing: -0.2,
                              color: FitnessAppTheme.nearlyDarkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, top: 2, bottom: 14),
                      child: Text(
                        'content in Soil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FitnessAppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: FitnessAppTheme.darkText,
                        ),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.only(
                    left: 4, right: 4, top: 8, bottom: 16),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.background,
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.access_time,
                            color: FitnessAppTheme.grey.withOpacity(0.5),
                            size: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            time,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 0.0,
                              color: FitnessAppTheme.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/bell.png'),
                          ),
                          Flexible(
                            child: Text(
                              widget.moist.subText,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 0.0,
                                color: HexColor('#F65283'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8, top: 16),
              child: Container(
                width: 60,
                height: 160,
                decoration: BoxDecoration(
                  color: HexColor('#E8EDFE'),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      bottomLeft: Radius.circular(80.0),
                      bottomRight: Radius.circular(80.0),
                      topRight: Radius.circular(80.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: FitnessAppTheme.grey.withOpacity(0.4),
                        offset: const Offset(2, 2),
                        blurRadius: 4),
                  ],
                ),
                child: WaveView(
                  percentageValue: double.parse(widget.moist.value),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
