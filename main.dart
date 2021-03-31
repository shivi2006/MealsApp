import 'package:flutter/material.dart';
import 'package:meals_app/Models/Dummy_categories.dart';
import 'package:meals_app/Models/Meals.dart';
import 'package:meals_app/Screens/CategoriesScreen.dart';
import 'package:meals_app/Screens/MealsDetailScreen.dart';
import 'package:meals_app/Screens/MealsScreen.dart';
import 'package:meals_app/Screens/TabsScreen.dart';
import '../Screens/MealsScreen.dart';
import '../Screens/FiltersScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp>{


  List<Meals> favorites =[];
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan':false,
    'vegetarian': false
  };

  List<Meals> availableMeals = DUMMY_MEALS ;

 void setFilters(Map<String,bool> filterDetails) {
    setState(() {
      filters = filterDetails;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree){
          return false;}
        if (filters['lactose'] && !meal.isLactoseFree)
          return false;
        if (filters['vegan'] && !meal.isVegan)
          return false;
        if (filters['vegetarian'] && !meal.isVegetarian)
          return false;
              return true;
      }).toList();
    }
    );
  }
  void setFav(String mealId){
    final existingId =  favorites.indexWhere((meal)
    {meal.id == mealId;});
    if(existingId>=0){
      setState(() {
        favorites.removeAt(existingId);
      });
    }
    else
      setState(() {
        favorites.add(DUMMY_MEALS.firstWhere((meal)
        { meal.id == mealId;}));
       });
  }

    bool isFavorite(String id){
    return favorites.any((meal)=> meal.id == id);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225,249,229,1),
      ),
        routes: {
        '/':(ctx)=> TabsScreen(favorites),
        '/categoriesScreen':(ctx)=> MealsScreen(availableMeals),
          '/meal-details':(ctx)=> MealDetailScreen(setFav, isFavorite),
          '/filters': (ctx)=> FiltersScreen(filters,setFilters)
        },

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
