import 'dart:async';
import 'package:drinks_flutter_before/src/models/categoriesModel.dart';
import 'package:drinks_flutter_before/src/resources/drinkApiProvider.dart';

class DrinkApiRepository{
  final categoriesApiProvider = DrinkApiProvider();

  Future<Categories> getCategories() => categoriesApiProvider.getCategory();
}