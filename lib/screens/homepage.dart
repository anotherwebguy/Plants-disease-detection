import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantdiseasedetector/diseases/AppleBlackRot.dart';
import 'package:plantdiseasedetector/diseases/AppleCedarRust.dart';
import 'package:plantdiseasedetector/diseases/AppleScab.dart';
import 'package:plantdiseasedetector/diseases/CherrySourMildew.dart';
import 'package:plantdiseasedetector/diseases/CornCommonRust.dart';
import 'package:plantdiseasedetector/diseases/CornGrayLeaf.dart';
import 'package:plantdiseasedetector/diseases/GrapeBlackRot.dart';
import 'package:plantdiseasedetector/diseases/GrapeEsca.dart';
import 'package:plantdiseasedetector/diseases/GrapeLeafBlight.dart';
import 'package:plantdiseasedetector/diseases/Healthy.dart';
import 'package:plantdiseasedetector/diseases/NorthernCornLeafBlight.dart';
import 'package:plantdiseasedetector/diseases/OrangeCitrus.dart';
import 'package:plantdiseasedetector/diseases/PeachSpot.dart';
import 'package:plantdiseasedetector/diseases/PepperBacterialSpot.dart';
import 'package:plantdiseasedetector/diseases/PotatoEarlyBlight.dart';
import 'package:plantdiseasedetector/diseases/PotatoLateBlight.dart';
import 'package:plantdiseasedetector/diseases/SquashMildew.dart';
import 'package:plantdiseasedetector/diseases/StrawberryLeafScorch.dart';
import 'package:plantdiseasedetector/diseases/TomatoBacteriaSpot.dart';
import 'package:plantdiseasedetector/diseases/TomatoEarlyBlight.dart';
import 'package:plantdiseasedetector/diseases/TomatoLateBlight.dart';
import 'package:plantdiseasedetector/diseases/TomatoLeafMold.dart';
import 'package:plantdiseasedetector/diseases/TomatoLeafSpot.dart';
import 'package:plantdiseasedetector/diseases/TomatoMosaic.dart';
import 'package:plantdiseasedetector/diseases/TomatoSpider.dart';
import 'package:plantdiseasedetector/diseases/TomatoTarget.dart';
import 'package:plantdiseasedetector/diseases/TomatoYellow.dart';
import 'package:plantdiseasedetector/screens/classifieddiseases.dart';
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
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;

const String mobile = "MobileNet";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  File _image;
  List _recognitions;
  String _model = mobile;
  double _imageHeight;
  double _imageWidth;
  bool dialVisible = true;
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    print("DEBUG: Inside Load Model Function");
    Tflite.close();
    try {
      String res;
      res = await Tflite.loadModel(
        model: "assets/plant_disease_model.tflite",
        labels: "assets/disease_labels.txt",
      );
      print(res);
    } on PlatformException {
      print('Failed to load model.');
      showErrorProcessing(context);
    }
  }

  void resultPage(BuildContext context, String name) {
    if(name == "apple apple scab"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => AppleScab()),
      );

    } else if(name == "apple black rot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => AppleBlack()),
      );
    } else if(name == "apple cedar apple rust"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => AppleCedarRust()),
      );
    }else if(name == "cherry including sour powdery mildew"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => CherrySour()),
      );
    }else if(name == "corn maize cercospora leaf spot gray leaf spot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => CornGrayLeaf()),
      );
    }else if(name == "corn maize common rust"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => CornCommonRust()),
      );
    }else if(name == "corn maize northern leaf blight"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => NorthernCornLeafBlight()),
      );
    }else if(name == "grape black rot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => GrapeBlackRot()),
      );
    }else if(name == "grape esca black measles"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => GrapeEsca()),
      );
    }else if(name == "grape leaf blight isariopsis leaf spot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => GrapeLeafBlight()),
      );
    }else if(name == "orange haunglongbing citrus greening"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => OrangeCitrus()),
      );
    }else if(name == "peach bacterial spot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => PeachSpot()),
      );
    }else if(name == "pepper bell bacterial spot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => PepperBacterialSpot()),
      );
    }else if(name == "potato early blight"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => PotatoEarlyBlight()),
      );
    }else if(name == "potato late blight"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => PotatoLateBlight()),
      );
    }else if(name == "squash powdery mildew"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => SquashMildew()),
      );
    }else if(name == "strawberry leaf scorch"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => StrawberryLeafScorch()),
      );
    }else if(name == "tomato bacterial spot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoBacteriaSpot()),
      );
    }else if(name == "tomato early blight"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoEarlyBlight()),
      );
    } else if(name == "tomato late blight"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoLateBlight()),
      );
    }else if(name == "tomato leaf mold"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoLeafMold()),
      );
    }else if(name == "tomato septoria leaf spot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoLeafSpot()),
      );
    }else if(name == "ttomato spider mites two spotted spider mite"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoSpider()),
      );
    }else if(name == "tomato target spot"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoTarget()),
      );
    }else if(name == "tomato tomato yellow leaf curl virus"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoYellow()),
      );
    }else if(name == "tomato tomato mosaic virus"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => TomatoMosaic()),
      );
    }else if(name == "apple healthy" || name == "blueberry healthy" || name == "cherry including sour healthy" || name == "corn maize healthy" || name == "grape healthy" || name == "peach healthy" || name == "pepper bell healthy" || name == "potato healthy" || name == "raspberry healthy" || name == "soybean healthyy" || name == "strawberry healthy" || name == "tomato healthy"){
      Navigator.push(
        context,
        MaterialPageRoute(

            builder: (context) => Healthy()),
      );
    } else {
      showErrorProcessing(context);
    }
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Future recognizeImage(File image) async {
    print("DEBUG: Inside Recognize Image Function");
    try {
      double percentage = 0.0;
      pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
      pr.style(
        message: 'Detecting Disease...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
      );
      var labelForHighest = "";
      double confidence = -1.00;
      Uint8List bytes = image.readAsBytesSync();
      img.Image oriImage = img.decodeJpg(bytes);
      img.Image resizedImage =
          img.copyResize(oriImage, width: 299, height: 299);
      var recognitions = await Tflite.runModelOnBinary(
        binary: imageToByteListFloat32(resizedImage, 299, 0, 255.0),
        numResults: 3,
        threshold: 0.5,
      );
      setState(() {
        _recognitions = recognitions;
      });

      pr.show();

      Future.delayed(Duration(seconds: 1)).then((onvalue) {
        percentage = percentage + 30.0;
        print(percentage);

        pr.update(
          progress: percentage,
          message: "Checking Confidence..",
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
        );

        Future.delayed(Duration(seconds: 1)).then((value) {
          percentage = percentage + 30.0;
          pr.update(progress: percentage, message: "Few more seconds...");
          print(percentage);
          Future.delayed(Duration(seconds: 2)).then((value) {
            percentage = percentage + 30.0;
            pr.update(progress: percentage, message: "Almost done..");
            print(percentage);

            Future.delayed(Duration(seconds: 1)).then((value) {
              pr.hide().whenComplete(() {
                print(pr.isShowing());
              });
              percentage = 0.0;
            });
          });
        });
      });
      Future.delayed(Duration(seconds: 6)).then((onValue) {
        print("PR status  ${pr.isShowing()}");
        if (pr.isShowing())
          pr.hide().then((isHidden) {
            print(isHidden);
          });
        print("PR status  ${pr.isShowing()}");

        if (_recognitions.isEmpty == false) {
          for (int i = 0; i < _recognitions.length; i++) {
            print(_recognitions[i]);
            if (_recognitions[i]['confidence'] > confidence) {
              labelForHighest = _recognitions[i]['label'];
              confidence = _recognitions[i]['confidence'];
            }
          }

          print(labelForHighest);
          print(confidence);
          if (confidence.abs() > 0.80) {
            resultPage(context, labelForHighest);
          } else {
            showCustomDialogWithImage(context, labelForHighest);
          }
        } else {
          showErrorProcessing(context);
        }
      });
    } on Exception {
      showErrorProcessing(context);
    }
  }

  void showCustomDialogWithImage(BuildContext context, var labelForHighest) {
    Dialog dialogWithImage = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 360.0,
        width: 300.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              child: Text(
                "We are not sure with the disease . Do you still wish to check the disease?",
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
                'assets/confusion.png',
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
                    'No',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                    resultPage(context, labelForHighest);
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => dialogWithImage);
  }

  Future predictImage(File image) async {
    print("DEBUG: Inside Predict Image Function");
    await recognizeImage(image);
    // await recognizeImageBinary(image);

    new FileImage(image)
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageHeight = info.image.height.toDouble();
        _imageWidth = info.image.width.toDouble();
      });
    }));
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //onSelect(mobile);
    if (image == null) return;
    predictImage(image);
  }

  Future getCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    predictImage(image);
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()));
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
                              padding: const EdgeInsets.only(left: 10.0),
                              child: text("Classified Diseases",
                                  fontFamily: fontMedium,
                                  fontSize: textSizeMedium),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: l - 249),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ClassifiedDiseases()));
                                  },
                                  child: Text(
                                    "View All",
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 10, right: 10, bottom: 10),
                        child: Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GrapeBlackRot()));
                                },
                                child: ItemCard(
                                  title: "Grape Black Rot",
                                  photo: "assets/grapeblack.jpg",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AppleCedarRust()));
                                },
                                child: ItemCard(
                                  title: "Apple Cedar Rust",
                                  photo: "assets/cedar.jpg",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CornGrayLeaf()));
                                },
                                child: ItemCard(
                                  title: "Corn Gray Leaf",
                                  photo: "assets/corngray.jpeg",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TomatoLateBlight()));
                                },
                                child: ItemCard(
                                  title: "Tomato Late Blight",
                                  photo: "assets/tlb3.jpg",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PotatoLateBlight()));
                                },
                                child: ItemCard(
                                  title: "Grape Leaf Blight",
                                  photo: "assets/grapebli.jpg",
                                ),
                              ),
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
              onTap: () => getCamera()),
          SpeedDialChild(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.image,
                color: Colors.white,
              ),
              label: 'Gallery',
              labelBackgroundColor: Colors.white,
              onTap: () => getImage()),
        ],
      ),
    );
  }
}
