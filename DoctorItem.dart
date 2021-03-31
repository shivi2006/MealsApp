import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DoctorItem extends StatelessWidget{
  final String id;
  final  String title;

  DoctorItem(this.id,this.title);

  void selectTheCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/HomeScreen',
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap:()=> selectTheCategory(context),
    splashColor: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(15),
    child: Container(
      padding: const EdgeInsets.all(30),

      child:Text(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent, Colors.blue
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