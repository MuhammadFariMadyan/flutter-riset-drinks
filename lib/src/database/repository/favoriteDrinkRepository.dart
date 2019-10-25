import 'package:drinks_flutter_before/src/database/dao/favoriteDrinkDao.dart';
import 'package:drinks_flutter_before/src/database/entity/favoriteDrink.dart';

class FavoriteDrinkRepository {
  final _favoriteDrinkDao = FavoriteDrinkDao();

  Future<int> insertFavoriteDrink(FavoriteDrink favoriteDrink) =>
      _favoriteDrinkDao.createFavoriteDrink(favoriteDrink);

  Future<List<FavoriteDrink>> getAllFavoriteDrinks() => _favoriteDrinkDao.getAllFavoriteDrinks();

  Future<List<FavoriteDrink>> getFavoriteDrinksById(String id) => _favoriteDrinkDao.getFavoriteDrinkById(id);

  Future<int> deleteFavoriteDrinkById(String id) => _favoriteDrinkDao.deleteFavoriteDrink(id);

}
