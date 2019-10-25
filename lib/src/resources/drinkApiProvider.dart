import 'dart:async';
import 'package:dio/dio.dart';
import 'package:drinks_flutter_before/src/models/categoriesModel.dart';
import 'package:drinks_flutter_before/src/models/filterCategories/filterCategories.dart';
import 'package:drinks_flutter_before/src/models/lookupDrinksById/lookupDrinksById.dart';
import 'package:drinks_flutter_before/src/models/searchDrinks/searchDrinks.dart';

class DrinkApiProvider{
  Dio dio = Dio();
  final _baseUrl = "https://www.thecocktaildb.com/api/json/v1/1";

  Future<Categories> getCategory() async {
    // print('Get List Category from API');
    final response = await dio.get("$_baseUrl/list.php?c=list");
    if(response.statusCode == 200){
      return Categories.fromJson(response.data);
    } else {
      throw Exception('Failed to get Categories');
    }
  }

  Future<LookupDrinksById> getLookupDrinksById(String idDrink) async {
    final response = await dio.get("$_baseUrl/lookup.php?i=$idDrink");
    if (response.statusCode == 200) {
      return LookupDrinksById.fromJson(response.data);
    } else {
      throw Exception("Failed to get lookup Drink by id");
    }
  }  

  // ListCategories getListCategoryStatic() {
  //   // print('Get List Category from Model Static');
  //   // final response = await ListCategories.listCategoriesJson;
  //   return ListCategories.fromJson(ListCategories.listCategoriesJson);
  // }

  // Filter by Category
  Future<FilterCategories> getFilterByCategories(String category) async {
    final response = await dio.get("$_baseUrl/filter.php?c=$category");
    if (response.statusCode == 200) {
      return FilterCategories.fromJson(response.data);
    } else {
      throw Exception("Failed to get filter by categories");
    }
  }

  // Search by name
  Future<SearchDrinks> getSearchDrinksByName(String name) async {
    final response = await dio.get("$_baseUrl/search.php?s=$name");
    if (response.statusCode == 200) {
      return SearchDrinks.fromJson(response.data);
    } else {
      throw Exception("Failed to get search drinks by name");
    }
  }
  
}