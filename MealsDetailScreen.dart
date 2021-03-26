import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Models/Dummy_categories.dart';

class MealDetailScreen extends StatelessWidget{

  Function setFavorite;
  Function isFavorite;
  MealDetailScreen(this.setFavorite, this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(mealDetail.imageUrl, fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10
              ),
              child: Text(
                "Ingredients",
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey,),
                borderRadius: BorderRadius.circular(10),
              ),
              // ignore: missing_return
              child: ListView.builder(itemBuilder: (ctx, index) =>
                  Card(
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(mealDetail.ingredients[index]),
                    ),
                  ),
                itemCount: mealDetail.ingredients.length,),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10
              ),
              child: Text(
                "Steps",
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey,),
                borderRadius: BorderRadius.circular(10),
              ),
              // ignore: missing_return
              child: ListView.builder(itemBuilder: (ctx, index) =>
                  Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Text("${(index + 1)}" + "." + " " +
                          mealDetail.steps[index]),
                    ),
                  ),
                itemCount: mealDetail.steps.length,),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId)? Icons.star : Icons.star_border),
        onPressed:()=> setFavorite(mealId),
      ),

    );

  }
}