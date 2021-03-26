import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/CategoryItem.dart';
import 'package:meals_app/Models/Dummy_categories.dart';

class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Delicious Meals"),),
      body:GridView(
        padding: EdgeInsets.all(20),
        children: dummy.map((category_data) {return CategoryItem(category_data.id,category_data.title,category_data.colour);}).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
           crossAxisSpacing: 20),
      )

    );
  }
}