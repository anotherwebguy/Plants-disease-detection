import 'package:flutter/material.dart';
import 'package:plantdiseasedetector/screens/diseasepage.dart';

class ItemCard extends StatelessWidget {
  final String title, photo;
  ItemCard({this.title, this.photo});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left:15,right: 15),
                      child:ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10)
                          ),
                          child: Stack(
                            children: [
                              Container(
                              height: 200,
                              width: 150,
                              child: Image.asset(photo, fit: BoxFit.cover,),
                              color: Colors.amber,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:10.0, bottom: 15),
                                  child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                              ],
                            )
                            ],
                            
                            ),
                        ),
          );
  }
}