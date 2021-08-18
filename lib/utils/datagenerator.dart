import 'package:flutter/material.dart';
import 'package:plantdiseasedetector/diseases/AppleBlackRot.dart';
import 'package:plantdiseasedetector/diseases/AppleCedarRust.dart';
import 'package:plantdiseasedetector/diseases/AppleScab.dart';
import 'package:plantdiseasedetector/diseases/CherrySourMildew.dart';
import 'package:plantdiseasedetector/diseases/CornCommonRust.dart';
import 'package:plantdiseasedetector/diseases/CornGrayLeaf.dart';
import 'package:plantdiseasedetector/diseases/GrapeBlackRot.dart';
import 'package:plantdiseasedetector/diseases/GrapeEsca.dart';
import 'package:plantdiseasedetector/diseases/GrapeLeafBlight.dart';
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
import 'package:plantdiseasedetector/models/diseasemodel.dart';

List<DiseasesModel> getDiseases() {
  List<DiseasesModel> list = List<DiseasesModel>();
  DiseasesModel model1 = DiseasesModel();
  model1.name = "Apple Black Rot";
  model1.image = "assets/black.jpg";
  model1.tag = AppleBlack();

  DiseasesModel model2 = DiseasesModel();
  model2.name = "Apple Cedar Rust";
  model2.image = "assets/cedar.jpg";
  model2.tag = AppleCedarRust();

  DiseasesModel model3 = DiseasesModel();
  model3.name = "Apple Scab";
  model3.image = "assets/scab.jpg";
  model3.tag = AppleScab();

  DiseasesModel model5 = DiseasesModel();
  model5.name = "Cherry Sour Powdery Mildew";
  model5.image = "assets/cherrysour.jpg";
  model5.tag = CherrySour();

  DiseasesModel model6 = DiseasesModel();
  model6.name = "Corn Common Rust";
  model6.image = "assets/corn.jpg";
  model6.tag = CornCommonRust();

  DiseasesModel model7 = DiseasesModel();
  model7.name = "Corn Gray Leaf";
  model7.image = "assets/corngray.jpeg";
  model7.tag = CornGrayLeaf();

  DiseasesModel model8 = DiseasesModel();
  model8.name = "Northern Corn Leaf Blight";
  model8.image = "assets/ncorn.JPG";
  model8.tag = NorthernCornLeafBlight();

  DiseasesModel model9 = DiseasesModel();
  model9.name = "Grape Black Rot";
  model9.image = "assets/grapeblack.jpg";
  model9.tag = GrapeBlackRot();

  DiseasesModel model10 = DiseasesModel();
  model10.name = "Grape Esca";
  model10.image = "assets/esca.jpg";
  model10.tag = GrapeEsca();

  DiseasesModel model11 = DiseasesModel();
  model11.name = "Grape Leaf Blight";
  model11.image = "assets/grapebli.jpg";
  model11.tag = GrapeLeafBlight();


  DiseasesModel model12 = DiseasesModel();
  model12.name = "Orange Citrus Greening";
  model12.image = "assets/orange.jpg";
  model12.tag = OrangeCitrus();

  DiseasesModel model13 = DiseasesModel();
  model13.name = "Peach Bacterial Spot";
  model13.image = "assets/peachspot1.jpg";
  model13.tag = PeachSpot();

  DiseasesModel model14 = DiseasesModel();
  model14.name = "Pepper Bacterial Spot";
  model14.image = "assets/pepper1.jpg";
  model14.tag = PepperBacterialSpot();

  DiseasesModel model15 = DiseasesModel();
  model15.name = "Potato Early Blight";
  model15.image = "assets/16.jpg";
  model15.tag = PotatoEarlyBlight();

  DiseasesModel model16 = DiseasesModel();
  model16.name = "Potato Late Blight";
  model16.image = "assets/plate.jpg";
  model16.tag = PotatoLateBlight();

  DiseasesModel model17 = DiseasesModel();
  model17.name = "Squash Powdery Mildew";
  model17.image = "assets/squash.jpg";
  model17.tag = SquashMildew();

  DiseasesModel model18 = DiseasesModel();
  model18.name = "Strawberry Leaf Scorch";
  model18.image = "assets/straw1.jpg";
  model18.tag = StrawberryLeafScorch();

  DiseasesModel model19 = DiseasesModel();
  model19.name = "Tomato Bacteria Spot";
  model19.image = "assets/tomato1.png";
  model19.tag = TomatoBacteriaSpot();

  DiseasesModel model20 = DiseasesModel();
  model20.name = "Tomato Early Blight";
  model20.image = "assets/tlb.jpg";
  model20.tag = TomatoEarlyBlight();

  DiseasesModel model21 = DiseasesModel();
  model21.name = "Tomato Late Blight";
  model21.image = "assets/latetomato.jpg";
  model21.tag = TomatoLateBlight();

  DiseasesModel model22 = DiseasesModel();
  model22.name = "Tomato Leaf Mold";
  model22.image = "assets/mold1.jpg";
  model22.tag = TomatoLeafMold();

  DiseasesModel model23 = DiseasesModel();
  model23.name = "Tomato Septoria Leaf Spot";
  model23.image = "assets/tomatospot2.jpeg";
  model23.tag = TomatoLeafSpot();

  DiseasesModel model24 = DiseasesModel();
  model24.name = "Tomato spider mites";
  model24.image = "assets/spider.jpg";
  model24.tag = TomatoSpider();

  DiseasesModel model25 = DiseasesModel();
  model25.name = "Tomato Target Spot";
  model25.image = "assets/target2.jpg";
  model25.tag = TomatoTarget();

  DiseasesModel model26 = DiseasesModel();
  model26.name = "Tomato Yellow Leaf Curl Virus";
  model26.image = "assets/curl.png";
  model26.tag = TomatoYellow();

  DiseasesModel model27 = DiseasesModel();
  model27.name="Tomato Mosaic Virus";
  model27.image="assets/mosaic2.jpg";
  model27.tag= TomatoMosaic();

  

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model5);
  list.add(model6);
  list.add(model7);
  list.add(model8);
  list.add(model9);
  list.add(model10);
  list.add(model11);
  list.add(model12);
  list.add(model13);
  list.add(model14);
  list.add(model15);
  list.add(model16);
  list.add(model17);
  list.add(model18);
  list.add(model19);
  list.add(model20);
  list.add(model21);
  list.add(model22);
  list.add(model23);
  list.add(model24);
  list.add(model25);
  list.add(model26);
  list.add(model27);
  return list;
}