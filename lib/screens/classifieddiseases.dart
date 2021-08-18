import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantdiseasedetector/screens/diseasepage.dart';
import 'package:plantdiseasedetector/utils/constants.dart';
import 'package:plantdiseasedetector/utils/getdiseases.dart';
import 'package:plantdiseasedetector/utils/widgets.dart';

class ClassifiedDiseases extends StatefulWidget {
  @override
  _ClassifiedDiseasesState createState() => _ClassifiedDiseasesState();
}

class _ClassifiedDiseasesState extends State<ClassifiedDiseases> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    Widget toolBarTitle(var title, {textColor = const Color(0xFF1e253a)}) {
      return text(title,
          fontSize: 20.0, fontFamily: 'Bold', textColor: textColor);
    }

    Widget appBar(context, var title, {actions}) {
      return AppBar(
        title: toolBarTitle(title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Color(0xFF1e253a)),
        backgroundColor: Colors.white.withOpacity(0.1),
        elevation: 0,
        actions: actions,
      );
    }

    return Scaffold(
      appBar: appBar(context, "Classified Diseases"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 2.0, bottom: 4.0),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: diseaseList.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var name = diseaseList[index].name;
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width * 0.32,
                          width: MediaQuery.of(context).size.width * 0.32,
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: new BorderRadius.circular(12.0),
                                child: Hero(
                                  tag: "${name}",
                                  child: Image.asset(
                                    diseaseList[index].image,
                                    fit: BoxFit.fill,
                                    height: MediaQuery.of(context).size.width *
                                        0.32,
                                    width: MediaQuery.of(context).size.width *
                                        0.32,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: width - (width / 3) - 16,
                          height: width / 2.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              text(diseaseList[index].name,
                                  textColor: Colors.black,
                                  fontFamily: fontBold,
                                  fontSize: textSizeNormal,
                                  maxLine: 2),
                              Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.timelapse,
                                            size: 16, color: Color(0XFF747474)),
                                        SizedBox(width: 2),
                                        text2("5 mins read")
                                      ],
                                    ),
                                    GestureDetector(
                                      child: Row(
                                        children: <Widget>[
                                          text2("Read", textColor: Colors.blue),
                                          Icon(Icons.keyboard_arrow_right,
                                              size: 16, color: Colors.blue),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    diseaseList[index].tag));
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                                Divider(
                                  height: 1,
                                  color: Color(0xFFDADADA),
                                  thickness: 1,
                                ),
                                SizedBox(height: 10),
                              ])
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
