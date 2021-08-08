import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:plantdiseasedetector/authentication/signin.dart';
import 'package:plantdiseasedetector/screens/homepage.dart';
import 'package:plantdiseasedetector/services/dbdata.dart';
import 'package:plantdiseasedetector/utils/dots_indicator/src/dots_decorator.dart';
import 'package:plantdiseasedetector/utils/dots_indicator/src/dots_indicator.dart';

class WalkThrough extends StatefulWidget {
  @override
  _LearnerWalkThroughState createState() => _LearnerWalkThroughState();
}

class _LearnerWalkThroughState extends State<WalkThrough> {
  AuthService _auth = new AuthService();
  int currentIndexPage = 0;
  int pageLength;
  bool _loading = false;
  var titles = ['Agri-Chain', 'Agri-Chain', 'Agri-Chain'];
  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text"
  ];

  //List<LearnerWalk> mList1;

  @override
  void initState() {
    super.initState();
    // mList1 = learnerWalkImg();
  }

  @override
  void dispose() {
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Color(0xFFF6F7FA));

    return ModalProgressHUD(
      inAsyncCall: _loading,
      color: Colors.black54,
      opacity: 0.7,
      progressIndicator: Theme(
        data: ThemeData.dark(),
        child: CupertinoActivityIndicator(
          animating: true,
          radius: 30,
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFF6F7FA),
              child: PageView(
                children: <Widget>[
                  WalkThroughUp(textContent: "slide3.png"),
                  WalkThroughUp(textContent: "slide2.jpg"),
                  WalkThroughUp(textContent: "slide1.jpg"),
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value);
                },
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 50,
              top: MediaQuery.of(context).size.height * 0.57,
              // left: MediaQuery.of(context).size.width * 0.35,
              child: Align(
                alignment: Alignment.center,
                child: DotsIndicator(
                    dotsCount: 3,
                    position: currentIndexPage,
                    decorator: DotsDecorator(
                        color: Color(0xFF808080), activeColor: Colors.purple)),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(titles[currentIndexPage],
                        style: TextStyle(
                            fontFamily: 'Bold',
                            fontSize: 20,
                            color: Color(0xFF38475B))),
                    SizedBox(height: 10),
                    Center(
                        child: Text(subTitles[currentIndexPage],
                            style: TextStyle(
                                fontFamily: 'Regular',
                                fontSize: 18,
                                color: Color(0xFF778390)),
                            textAlign: TextAlign.center)),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height * 0.44,
                          height: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            // color: Colors.blue[500],
                          ),
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () async {
                              setState(() {
                                _loading = true;
                              });
                              final result = await _auth.signInWithGoogle();
                              if (result != null) {
                                await fetchData();
                                setState(() {
                                  _loading = false;
                                });
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                ), (route) => false);
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blue[700]),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/googleLogo.png",
                                  height: 30.0,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sign In With Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.blue[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //Color(0xFF345FFB)
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Row(
                  children: <Widget>[
                    // IconButton(
                    //   icon: Icon(Icons.arrow_back),
                    //   onPressed: () {
                    //     Navigator.of(context).pop();
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WalkThroughUp extends StatelessWidget {
  final String textContent;

  WalkThroughUp({Key key, @required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Image.asset("assets/learnerWalkBackImg.png",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.6),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.55,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/${textContent}",
                  width: 300,
                  height: (MediaQuery.of(context).size.height) * 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  var textContent;
  Color color;
  Color textcolor;
  VoidCallback onPressed;

  Button(
      {@required this.textContent,
      @required this.onPressed,
      this.color,
      this.textcolor});

  @override
  State<StatefulWidget> createState() {
    return T9ButtonState();
  }
}

class T9ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: widget.onPressed,
        textColor: widget.textcolor,
        elevation: 4,
        color: widget.color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.textContent,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
