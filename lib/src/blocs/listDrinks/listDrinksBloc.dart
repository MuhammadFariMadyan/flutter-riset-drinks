import 'package:drinks_flutter_before/src/database/entity/favoriteDrink.dart';
import 'package:drinks_flutter_before/src/database/repository/favoriteDrinkRepository.dart';
import 'package:drinks_flutter_before/src/models/filterCategories/filterCategories.dart';
import 'package:drinks_flutter_before/src/models/lookupDrinksById/lookupDrinksById.dart';
import 'package:drinks_flutter_before/src/resources/drinkApiRepository.dart';

class ListDrinksBloc {
  final _drinkApiRepository = DrinkApiRepository();
  final _favoriteDrinkRepository = FavoriteDrinkRepository();

  dispose() {
    // TODO: do something in here
  }

  Future<FilterCategories> getFilterCategories(String category) async {
    FilterCategories filterCategories =
        await _drinkApiRepository.getFilterByCategories(category);
    List<FavoriteDrink> listFavoriteDrinks =
        await _favoriteDrinkRepository.getAllFavoriteDrinks();
    List<FilterCategoryItem> listFilterCategoryItems =
        filterCategories.filterCategoryItems.where((item) {
      bool isFavorite = false;
      for (FavoriteDrink favoriteDrink in listFavoriteDrinks) {
        if (item.idDrink == favoriteDrink.idDrink) {
          isFavorite = true;
          break;
        }
      }
      item.isFavorite = isFavorite;
      return true;
    }).toList();
    filterCategories.filterCategoryItems = listFilterCategoryItems;
    return filterCategories;
  }

  Future<LookupDrinksById> getDetailDrinkById(String id) async {
    LookupDrinksById lookupDrinksById = await _drinkApiRepository.getLookupDrinksById(id);
    return lookupDrinksById;
  }

  Future<int> addFavoriteDrink(FavoriteDrink favoriteDrink) async {
    return await _favoriteDrinkRepository.insertFavoriteDrink(favoriteDrink);
  }

  Future<int> deleteFavoriteDrinkById(String id) async {
    return await _favoriteDrinkRepository.deleteFavoriteDrinkById(id);
  }
}

final listDrinksBloc = ListDrinksBloc();
