import 'package:drinks_flutter_before/src/models/categoriesModel.dart';
import 'package:drinks_flutter_before/src/models/filterCategories/filterCategories.dart';
import 'package:drinks_flutter_before/src/models/lookupDrinksById/lookupDrinksById.dart';
import 'package:drinks_flutter_before/src/resources/drinkApiProvider.dart';

class DrinkApiRepository{
  final drinkApiProvider = DrinkApiProvider();

  Future<Categories> getCategories() => drinkApiProvider.getCategory();
  // Future<ListCategories> getListCategoryStatic() => categoriesApiProvider.getListCategoryStatic();

  Future<LookupDrinksById> getLookupDrinksById(String idDrink) => drinkApiProvider.getLookupDrinksById(idDrink);

  Future<FilterCategories> getFilterByCategories(String category) =>
      drinkApiProvider.getFilterByCategories(category);
}