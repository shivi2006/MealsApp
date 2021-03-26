

import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meals.dart';
import 'package:meals_app/Widgets/MealItem.dart';

class FavouritesScreen extends StatelessWidget{

  List<Meals> favorites;
  FavouritesScreen(this.favorites);
  @override
  Widget build(BuildContext) {
    if (favorites.isEmpty) {
      return Center(
        child: Text("No favourites added...Start Adding some", ),
      );
    }
    else
      return ListView.builder
        (itemBuilder: (ctx, index) {
        return MealItem(id: favorites[index].id,
          imageUrl: favorites[index].imageUrl,
          title: favorites[index].title,
          duration:favorites[index].duration,
          complexity: favorites[index].complexity,
          affordability: favorites[index].affordability,);
      },
        itemCount: favorites.length,
      );
  }

  }