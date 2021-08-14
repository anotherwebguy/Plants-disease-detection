import 'package:flutter/material.dart';
import 'package:plantdiseasedetector/screens/diseasepage.dart';

class ItemCard extends StatelessWidget {
  final String title, photo, description, solution;
  ItemCard({this.title, this.photo, this.description,this.solution});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left:15,right: 15),
                      child: GestureDetector(
                        onTap: (){
                          print("Hello");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DiseasePage(title: title,
                          photo: photo,
                          description: description,
                          solution: solution,
                          )));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10)
                          ),
                          child: Stack(
                            children: [
                              Container(
                              height: 250,
                              width: 180,
                              child: Image.asset(photo, fit: BoxFit.cover,),
                              color: Colors.amber,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:15.0, bottom: 15),
                                  child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                              ],
                            )
                            ],
                            
                            ),
                        ),
                      ),
          );
  }
}