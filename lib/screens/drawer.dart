

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plantdiseasedetector/authentication/signin.dart';
import 'package:plantdiseasedetector/diseases/AppleCedarRust.dart';
import 'package:plantdiseasedetector/diseases/CherrySourMildew.dart';
import 'package:plantdiseasedetector/diseases/TomatoLeafSpot.dart';
import 'package:plantdiseasedetector/screens/classifieddiseases.dart';
import 'package:plantdiseasedetector/screens/homepage.dart';
import 'package:plantdiseasedetector/screens/notifications.dart';
import 'package:plantdiseasedetector/screens/walkthrough.dart';
import 'package:plantdiseasedetector/services/dbdata.dart';
import 'package:plantdiseasedetector/utils/colors.dart';
import 'package:plantdiseasedetector/utils/widgets.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  var selectedItem = -1;
  int counter=0;
  AuthService _auth = new AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  

  Widget getDrawerItem(IconData icon, String name, int pos,{var tags,ind}) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedItem = pos;
        });
        if(tags!=null){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tags));
        } else if(ind == "log"){
          showDialog(context: context,
            builder: (context)=>AlertDialog(
              backgroundColor: Colors.white,
              title: Text("Confirmation", style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)),
              content: Text(
                "Are you sure you want to logout?",
                style: TextStyle(color:Colors.black),
              ),
              actions: [
                FlatButton(
                  child: Text(
                    "Yes",
                    style: TextStyle(color:Colors.blue,),
                  ),
                  onPressed: () async{
                    await _auth.signOutGoogle();
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                     return WalkThrough();
                   }), (route) => false);
                  },
                ),
                FlatButton(
                  child: Text("No", style: TextStyle(color:Colors.blue,)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        } else if(ind =="home"){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ), (route) => false);
        }
      },
      child: Container(
        color: selectedItem == pos ? Color(0XFFF2ECFD) : Colors.white,
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Row(
          children: <Widget>[
            Icon(icon,size: 20,),
            //SvgPicture.asset(icon, width: 20, height: 20),
            SizedBox(width: 20),
            text2(name,
                textColor:
                selectedItem == pos ? Color(0XFF5959fc) : t5DarkNavy,
                fontSize: 18.0,
                fontFamily: 'Medium')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        elevation: 8,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.only(top: 30, right: 10),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 40, 20, 40),
                      decoration: new BoxDecoration(
                          color: t5DarkNavy,
                          borderRadius: new BorderRadius.only(
                              bottomRight: const Radius.circular(24.0),
                              topRight: const Radius.circular(24.0))),
                      /*User Profile*/
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(profileimg,),
                              radius: 40),
                          SizedBox(width: 5),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: text1(name,
                                        textColor: Colors.white,
                                        fontFamily: 'Medium',
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(height: 8),
                                  text(email,
                                      textColor: Colors.white,
                                      fontSize: 14.0),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 30),
                getDrawerItem( Icons.dashboard,"Home", 1,ind: "home"),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0),
                  child: Divider(color: Color(0XFFDADADA), height: 1),
                ),
                getDrawerItem( Icons.dock_sharp,"Classified Diseases", 2,tags: ClassifiedDiseases()),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0),
                  child: Divider(color: Color(0XFFDADADA), height: 1),
                ),
                //getDrawerItem(Icons.history, "History", 3),
                getDrawerItem(Icons.notifications_active, "Notifications", 3,tags: Notifications()),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0),
                  child: Divider(color: Color(0XFFDADADA), height: 1),
                ),
                getDrawerItem(Icons.logout, "Logout", 4,ind: "log"),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0),
                  child: Divider(color: Color(0XFFDADADA), height: 1),
                ),
                SizedBox(height: 30),
                //Divider(color: Color(0XFFDADADA), height: 1),
                SizedBox(height: 30),
                // getDrawerItem(t2_share, t2_lbl_share_and_invite, 6),
                // getDrawerItem(t2_help, t2_lbl_help_and_feedback, 7),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
