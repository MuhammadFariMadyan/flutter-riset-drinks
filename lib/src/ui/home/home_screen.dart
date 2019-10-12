import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drinks_flutter_before/src/util/utils.dart';
import 'package:drinks_flutter_before/src/blocs/homeBloc.dart';
import 'package:drinks_flutter_before/src/models/categoriesModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {      

  @override
  void dispose() {
    homebloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: FutureBuilder(
        future: homebloc.getCategories(),
        builder: (context, AsyncSnapshot<Categories> snapshot){
          if(snapshot.hasData){            
            Categories categories = snapshot.data;
            return Container(              
              child: ListView.builder(
                itemCount: categories.drinks.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(categories.drinks[index].strCategory),
                  );
                },
              )
            );
          } else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          } return Center(
            child: buildCircularProgressIndicator(),
          );
        },
      )
    );
  }  
}
