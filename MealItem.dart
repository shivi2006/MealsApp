import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meals.dart';

class MealItem extends StatelessWidget{

  String id;
  String title;
  String imageUrl;
  int duration;
  Complexity complexity;
  Affordability affordability;
  Function removeItem;

  MealItem({this.id,this.affordability,this.complexity,this.title,this.imageUrl,this.duration,this.removeItem});

  String get ComplexityTest{
    if(complexity==Complexity.Simple)
      return "Simple";
    else if (complexity==Complexity.Hard)
      return "Hard";
    else
      return "Challenging";
  }

  String get AffordabilityTest{
    if(affordability==Affordability.Affordable)
      return "Affordable";
    else if(affordability==Affordability.Pricey)
      return "Pricey";
    else
      return "Expensive";
  }

  void selectMeal(context){
  Navigator.of(context).pushNamed('/meal-details',arguments:id).then((result){
    if(result!=null)
      removeItem(result);
  });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child:Column(
        children: <Widget>[
          Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
              ),
              child:Image.network(imageUrl,height: 250,width:double.infinity,fit:BoxFit.cover),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                width: 220,
              color: Colors.black54,
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20
              ),
                  child:Text(
                  title,
                  style: TextStyle(
                  fontSize: 26,
                  color: Colors.white
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
            )
              )
            )
          ],
        ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(Icons.schedule),
                  SizedBox(width: 6,),
                  Text('$duration min'),
              ],
            ),
              Row(children: <Widget>[
                Icon(Icons.work),
                 SizedBox(width: 6,),
                Text(ComplexityTest),
              ],
             ),
                Row(children: <Widget>[
                  Icon(Icons.attach_money),
                  SizedBox(width: 6,),
                  Text(AffordabilityTest),
                ],
                ),
    ]

          )
          )
            ]

      )
      )
    );
  }
}