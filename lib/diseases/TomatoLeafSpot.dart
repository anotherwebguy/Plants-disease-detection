import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class TomatoLeafSpot extends StatefulWidget {
  TomatoLeafSpot({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TomatoLeafSpotState createState() => _TomatoLeafSpotState();
}

class _TomatoLeafSpotState extends State<TomatoLeafSpot> {
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
                      tag: "Tomato Septoria Leaf Spot",
                      child: Carousel(
                        images: [
                          AssetImage('assets/tomatospot2.jpeg'),
                          // Photo from https://unsplash.com/photos/2d4lAQAlbDA
                          AssetImage('assets/tomatospot1.jpg'),
                          // Photo from https://unsplash.com/photos/FqqiAvJejto
                          AssetImage('assets/tomatospot3.jpg'),
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
                          'Tomato Septoria Leaf Spot',
                          style: new TextStyle(
                            fontFamily: "VT323",
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          'Septoria lycopersici',
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
            '1. Septoria leaf spot is caused by the fungus Septoria lycopersici. This fungus can attack tomatoes at any stage of development, but symptoms usually first appear on the older, lower leaves and stems when plants are setting fruit.\n\n2. Symptoms usually appear on leaves, but can occur on petioles, stems, and the calyx. The first symptoms appear as small, water-soaked, circular spots 1/16 to 1/8" in diameter on the undersides of older leaves.\n\n3. The centers of these spots then turn gray to tan and have a dark-brown margin. The spots are distinctively circular and are often quite numerous. As the spots age, they sometimes enlarge and often coalesce.\n\n4. A diagnostic feature of this disease is the presence of many dark-brown, pimple-like structures called pycnidia (fruiting bodies of the fungus) that are readily visible in the tan centers of the spots. When spots are numerous, affected leaves turn yellow and eventually shrivel up, brown, and drop off.\n\n5. Defoliation usually starts on the oldest leaves and can quickly spread progressively up the plant toward the new growth. Significant losses can result from early leaf-drop and often leads to the subsequent sunscalding of the fruit when plants are prematurely defoliated.',
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
            '1. Septoria leaf spot is favored by warm, wet, humid conditions. Although the fungus can survive in or on seed and in weed hosts, the main source of inoculum is from leaf fragments and other plant debris from diseased plants that overwinter in the soil.\n\n2. Under wet conditions, spores (also called conidia) of the fungus are produced in the pycnidia. These spores are spread to healthy tomato leaves by windblown water, splashing rain, overhead irrigation systems, hands and clothing of pickers, cultivation equipment, and several types of insects such as Colorado potato beetles, flea beetles, tomato worms, and aphids.\n\n3. Following this initial spread and when free moisture is present on the leaves, the spores germinate, infect the tomato tissues, and spots usually appear within 5 days. Pycnidia subsequently develop in these new spots, more spores are produced, secondary cycles of infection begin, and the disease spreads.',
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
            '1. It is very important to eliminate initial sources of inoculum by removing or destroying as much of the tomato debris as possible after harvest in the fall.\n\n2. Alternatively, in large fields where plant removal is not practical, plant debris can be covered and buried by deep plowing.\n\n3. During the growing season, it is important to start with healthy, disease-free transplants. If infected plants are found, rogue the seedlings before transplanting them into the field.\n\n4. It is also helpful to practice crop rotation with a non-Solanaceous crop, if possible.\n\n5. Since water is important to both the spread and development of this disease, it is helpful to avoid overhead watering or to water early in the day so that the leaves dry more quickly than with nighttime watering. In addition, it is helpful to avoid working with plants when they are wet.',
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
            '1. Fungicides are very effective for control of Septoria leaf spot and applications are often necessary to supplement the control strategies previously outlined.\n\n2. The fungicides chlorothalonil and mancozeb are labeled for homeowner use. Since these are protectant materials, they should be applied as soon as symptoms are observed and repeated as necessary when conditions are favorable for disease development and spread.\n\n3. The fungicide labels contain information on dosage rates, spray intervals, days-to-harvest intervals, and safety precautions.',
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
