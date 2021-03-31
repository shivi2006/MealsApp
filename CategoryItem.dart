import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Screens/MealsScreen.dart';

class CategoryItem extends StatelessWidget{
  String id;
  String title;
  Color colour;

  CategoryItem(this.id,this.title,this.colour);

  void selectTheCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/categoriesScreen',
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap:()=> selectTheCategory(context),
    splashColor: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(15),
    child: Container(
      padding: const EdgeInsets.all(10),
      child:Text(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colour.withOpacity(0.7),
            colour,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
            borderRadius: BorderRadius.circular(10)
      ),
    )



    );
  }


}