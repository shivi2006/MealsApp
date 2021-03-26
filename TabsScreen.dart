import 'package:flutter/material.dart';
import 'package:meals_app/Models/Meals.dart';
import 'package:meals_app/Screens/CategoriesScreen.dart';
import 'FavouritesScreen.dart';
import 'package:meals_app/Widgets/DrawerDetail.dart';

class TabsScreen extends StatefulWidget{

  List<Meals> favorites;
  TabsScreen(this.favorites);
  @override
  TabsScreenState createState()=> TabsScreenState();

}

class TabsScreenState extends State<TabsScreen>{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title:Text("Meals"),

        bottom: TabBar(
          tabs:<Widget>[
            Tab(
               icon: Icon(Icons.category),
              text: "Categories"),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Favourites"),
      ]
            ),
    ),
      drawer: Drawer(child: DrawerDetail()),
      body: TabBarView(children: <Widget>[
        CategoriesScreen(),FavouritesScreen(widget.favorites)
      ]),

    )
    );
    
  }

}