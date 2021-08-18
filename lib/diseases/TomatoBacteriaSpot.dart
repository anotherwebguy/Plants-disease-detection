import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class TomatoBacteriaSpot extends StatefulWidget {
  TomatoBacteriaSpot({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TomatoBacteriaSpotState createState() => TomatoBacteriaSpotState();
}

class TomatoBacteriaSpotState extends State<TomatoBacteriaSpot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
                height: 300.0,
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: "Tomato Bacteria Spot",
                      child: Carousel(
                        images: [
                          AssetImage('assets/tomato1.png'),
                          // Photo from https://unsplash.com/photos/2d4lAQAlbDA
                          AssetImage('assets/tomato2.jpg'),
                          // Photo from https://unsplash.com/photos/FqqiAvJejto
                          AssetImage('assets/tomato3.jpg'),
                          // Photo from https://unsplash.com/photos/_-JR5TxKNSo
                        ],
                        dotSize: 4.0,
                        dotSpacing: 15.0,
                        autoplay: true,
                        dotColor: Colors.white,
                        indicatorBgPadding: 50.0,
                        dotBgColor: Colors.transparent,
                        borderRadius: false,
                        moveIndicatorFromBottom: 200.0,
                        noRadiusForIndicator: true,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 270, left: 20, right: 20),
              child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tomato Bacteria Spot',
                          style: new TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Xanthomonas campestris pv. vesicatoria',
                          style: new TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 60, bottom: 20, left: 14),
          child: Text(
            'SYMPTOMS',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'Bacterial spot develops on seedlings and mature plants. On seedlings, infections may cause severe defoliation. On older plants, infections occur primarily on older leaves and appear as water-soaked areas. Leaf spots turn from yellow or light green to black or dark brown. Older spots are black, slightly raised, superficial and measure up to 0.3 inch (7.5 mm) in diameter. Larger leaf blotches may also occur, especially on the margins of leaves. Symptoms on immature fruit are at first slightly sunken and surrounded by a water-soaked halo, which soon disappears. Fruit spots enlarge, turn brown, and become scabby.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'FAVORABLE ENVIRONMENT CONDITIONS',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            '1. The bacterial spot bacterium persists from one season to the next in crop debris, on volunteer tomatoes, and on weed hosts such as nightshade and groundcherry.\n\n2. The bacterium is seedborne and can occur within the seed and on the seed surface. The pathogen is spread with the seed or on transplants.\n\n3. Secondary spread within a field occurs by splashing water from sprinkler irrigation or rain. Infection is favored by high relative humidity and free moisture on the plant.\n\n4. Symptoms develop rapidly at temperatures of 68°F (20°C) and above. Night temperatures of 61°F (16°C) or below suppress disease development regardless of day temperatures.\n\n5. Some pathogen strains are virulent on either tomato or pepper and some may be virulent on both.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'MANAGEMENT (REMEDIES)',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            '1. The most effective management strategy is the use of pathogen-free certified seeds and disease-free transplants to prevent the introduction of the pathogen into greenhouses and field production areas.\n\n2. Inspect plants very carefully and reject infected transplants- including your own! In the greenhouse, discard trays adjacent to outbreak location to minimize disease spread. In transplant production greenhouses, minimize overwatering and handling of seedlings when they are wet.\n\n3. Trays, benches, tools, and greenhouse structures should be washed and sanitized between seedlings crops. Crop rotation should be used to avoid pathogen carryover on volunteers and crop residue.\n\n4. Avoid fields that have been planted with peppers or tomatoes within one year, especially if they had bacterial spot previously.\n\n5. Eliminate solanaceous weeds in and around tomato and pepper production areas. Keep cull piles away from field operations. Do not spray, tie, harvest, or handle wet plants as that can spread the disease.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20, left: 14),
          child: Text(
            'CHEMICAL/BIOLOGICAL CONTROL',
            style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
          child: Text(
            'Copper-containing bactericides provide partial disease control. Apply at first sign of disease and repeat at 10- to 14-day intervals when warm, moist conditions prevail. Copper is strictly a protectant and must be applied before an infection period occurs.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
          ),
        ),
      ],
    ));
  }

  Widget amenities(
    String url1,
    String url2,
    String url3,
    String features1,
    String features2,
    String features3,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url1,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features1)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url2,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features2)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url3,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features3)
              ],
            )),
      ],
    );
  }

  Widget about_hotel(
    String description,
  ) {
    return Padding(
        padding: EdgeInsets.only(left: 14, top: 6, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ],
        ));
  }
}
