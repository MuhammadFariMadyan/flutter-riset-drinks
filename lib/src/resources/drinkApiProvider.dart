import 'dart:async';
import 'package:dio/dio.dart';
import 'package:drinks_flutter_before/src/models/categoriesModel.dart';

class DrinkApiProvider{
  Dio dio = Dio();
  final _baseUrl = "https://www.thecocktaildb.com/api/json/v1/1";

  Future<Categories> getCategory() async {
    print('masuk');
    final response = await dio.get("$_baseUrl/list.php?c=list");
    if(response.statusCode == 200){
      return Categories.fromJson(response.data);
    } else {
      throw Exception('Failed to get Categories');
    }

  }
}