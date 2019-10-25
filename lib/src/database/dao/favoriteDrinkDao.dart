import 'package:drinks_flutter_before/src/database/entity/favoriteDrink.dart';

import '../database.dart';

class FavoriteDrinkDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createFavoriteDrink(FavoriteDrink favoriteDrink) async {
    final db = await dbProvider.database;
    var result = db.insert(favoriteTable, favoriteDrink.toJson());
    return result;
  }

  Future<List<FavoriteDrink>> getAllFavoriteDrinks() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result;
    result = await db.query(favoriteTable);
    List<FavoriteDrink> listFavoriteDrinks = result.isNotEmpty
        ? result.map((resultMap) {
            return FavoriteDrink.fromJson(resultMap);
          }).toList()
        : [];
    return listFavoriteDrinks;
  }

  Future<List<FavoriteDrink>> getFavoriteDrinkById(String id) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result;
    result = await db.query(favoriteTable, where: "idDrink = ?", whereArgs: [id]);
    List<FavoriteDrink> listFavoriteDrinks = result.isNotEmpty
        ? result.map((resultMap) {
            return FavoriteDrink.fromJson(resultMap);
          }).toList()
        : [];
    return listFavoriteDrinks;
  }

  Future<int> deleteFavoriteDrink(String id) async {
    final db = await dbProvider.database;
    var result =
        await db.delete(favoriteTable, where: "idDrink = ?", whereArgs: [id]);
    return result;
  }
}
