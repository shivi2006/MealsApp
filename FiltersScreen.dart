import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/DrawerDetail.dart';

class FiltersScreen extends StatefulWidget {

  Function filterData;
  Map<String,bool> filtersSaved;

  FiltersScreen(this.filtersSaved,this.filterData);

  @override
  FiltersScreenState createState() => FiltersScreenState();
}
class FiltersScreenState extends State<FiltersScreen>{
  bool glutenf =  false;
  bool Vegan = false;
  bool Vegetarian = false;
  bool lactosef = false;

  @override
  void initState() {
    glutenf = widget.filtersSaved['gluten'];
    lactosef = widget.filtersSaved['lactose'];
    Vegan = widget.filtersSaved['vegan'];
    Vegetarian= widget.filtersSaved['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("Your Filters"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed:(){

            final selectedFilters = {
              'gluten': glutenf,
              'lactose': lactosef,
              'vegan': Vegan,
              'vegetarian': Vegetarian
            };
            widget.filterData(selectedFilters);}
            )
      ],

      ),
      drawer: DrawerDetail(),
      body: Column(
       children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection!!", style: Theme.of(context).textTheme.title),
      ),
          Expanded(
            child: ListView(
            children: <Widget>[
            SwitchListTile(
              title:Text("Gluten Free"),
              value: glutenf,
              subtitle: Text("Only include gluten free meals",),
              onChanged:(newValue){
                setState(() {
                      glutenf = newValue;
                    });
                 },
            ),
                SwitchListTile(
                  title:Text("Vegetarian food"),
                  value: Vegetarian,
                  subtitle: Text("Only Vegetarian meals",
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      Vegetarian = newValue;
                    });
                  },

                ),
                SwitchListTile(
                  title:Text("Lactose Free"),
                  value: lactosef,
                  subtitle: Text("Only include lactose free meals",
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      lactosef = newValue;
                    });
                  },

                ),
                SwitchListTile(
                  title:Text("Vegan"),
                  value: Vegan,
                  subtitle: Text("Only Vegan meals",
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      Vegan = newValue;
                    });
                  },

                )
              ],
            ),
          )
    ]
      )


    );

  }
}