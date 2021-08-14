import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantdiseasedetector/diseases/AppleScab.dart';
import 'package:plantdiseasedetector/diseases/GrapeEsca.dart';
import 'package:plantdiseasedetector/diseases/PotatoLateBlight.dart';
import 'package:plantdiseasedetector/screens/drawer.dart';
import 'package:plantdiseasedetector/screens/moisture.dart';
import 'package:plantdiseasedetector/screens/notifications.dart';
import 'package:plantdiseasedetector/screens/planthealth.dart';
import 'package:plantdiseasedetector/services/dbdata.dart';
import 'package:plantdiseasedetector/utils/colors.dart';
import 'package:plantdiseasedetector/utils/constants.dart';
import 'package:plantdiseasedetector/utils/itemcard.dart';
import 'package:plantdiseasedetector/utils/planthealththeme.dart';
import 'package:plantdiseasedetector/utils/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var l = MediaQuery.of(context).size.width;
    changeStatusColor(t5DarkNavy);
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: t5DarkNavy,
      key: _scaffoldKey,
      drawer: Drawer(child: UserDrawer()),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 70,
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(profileimg),
                        radius: 25,
                      ),
                      SizedBox(width: 16),
                      text(name,
                          textColor: Colors.white,
                          fontSize: textSizeNormal,
                          fontFamily: fontMedium)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                          print("SVsvsdv");
                        },
                        icon: SvgPicture.asset(
                          "assets/t5_notification_2.svg",
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 7),
                      IconButton(
                        onPressed: () {
                          if (_scaffoldKey.currentState.isDrawerOpen) {
                            _scaffoldKey.currentState.openEndDrawer();
                          } else {
                            _scaffoldKey.currentState.openDrawer();
                          }
                        },
                        icon: SvgPicture.asset(
                          "assets/t5_options.svg",
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Container(
                padding: EdgeInsets.only(top: 28),
                alignment: Alignment.bottomLeft,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: FitnessAppTheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      PlantHealth(),
                      Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: text("Classified Diseases", fontFamily: fontMedium, fontSize: textSizeMedium),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: l- 249),
                            child: GestureDetector(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                              },
                              child: Text("View All", style: TextStyle(color: Colors.blue),)),
                          )
                        ],
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(top:5.0, left: 10,right: 10, bottom: 10),
                        child: Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GrapeEsca()));
                                },
                                child: ItemCard(
                                  title: "Grape Esca",
                                  photo: "https://raw.githubusercontent.com/midhun1998/Plant-App-Flutter-Project/master/example/assets/22.jpg",
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AppleScab()));
                                },
                                child: ItemCard(
                                  title: "Apple Scab",
                                  photo: "https://raw.githubusercontent.com/midhun1998/Plant-App-Flutter-Project/master/example/assets/3.jpg",
                                  ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PotatoLateBlight()));
                                },
                                child: ItemCard(
                                  title: "Potato Late Blight",
                                  photo: "https://raw.githubusercontent.com/midhun1998/Plant-App-Flutter-Project/master/example/assets/33.jpg",
                                  ),
                              )
                            ],
                          ),
                        ),
                      ),
                      MoistureView(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_home,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.camera,
                color: Colors.white,
              ),
              label: 'Camera',
              labelBackgroundColor: Colors.white,
              onTap: () {}),
          SpeedDialChild(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.photo,
                color: Colors.white,
              ),
              label: 'Gallery',
              labelBackgroundColor: Colors.white,
              onTap: () {}),
        ],
      ),
    );
  }
}
