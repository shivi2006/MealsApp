import 'package:flutter/material.dart';

class DrawerDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text('Cooking Up!!',style: TextStyle(fontWeight: FontWeight.w900,fontSize:30, color:Theme.of(context).accentColor),),
          ),
      ),
       SizedBox(
         height: 20,
       ),
          ListTile(
              leading: Icon(Icons.restaurant, size: 26,),
            title: Text("Meals",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            onTap: (){
                Navigator.of(context).pushReplacementNamed('/');

            },

          ),
          ListTile(
            leading: Icon(Icons.settings, size: 26,),
            title: Text("Filters",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            onTap: (){
                Navigator.of(context).pushReplacementNamed('/filters');
            },

          )
        ]
    )
    );
  }
}