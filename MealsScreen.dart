

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Models/Dummy_categories.dart';
import 'package:meals_app/Models/Meals.dart';
import 'package:meals_app/Widgets/MealItem.dart';

class MealsScreen extends StatefulWidget {

  List<Meals> availableMeals;
  MealsScreen(this.availableMeals);

  @override
  MealsScreenState createState()=> MealsScreenState();
}
class MealsScreenState extends State<MealsScreen>{
  List<Meals> categoryMeals;
  String routeTitle;
  var loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final modalRoutes = ModalRoute.of(context).settings.arguments as Map<String,String>;
      final routeId = modalRoutes['id'];
      routeTitle = modalRoutes['title'];
      categoryMeals = widget.availableMeals.where((meals){
        return meals.categories.contains(routeId);
      }).toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(routeTitle),
      ),
        body: ListView.builder(itemBuilder: (ctx,index){
          return MealItem(id:categoryMeals[index].id, imageUrl:categoryMeals[index].imageUrl,
              title:categoryMeals[index].title,duration:categoryMeals[index].duration,
          complexity:categoryMeals[index].complexity,affordability:categoryMeals[index].affordability,removeItem: removeMeal,);
        },
      itemCount: categoryMeals.length,
      )


    );
  }
}