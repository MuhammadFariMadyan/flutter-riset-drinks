import 'package:json_annotation/json_annotation.dart';
part 'filterCategories.g.dart';

@JsonSerializable()
class FilterCategories {
  @JsonKey(name: "drinks")
  List<FilterCategoryItem> filterCategoryItems;

  FilterCategories({this.filterCategoryItems});

  @override
  String toString() {
    return 'FilterCategories{filterCategoryItems: $filterCategoryItems}';
  }

  factory FilterCategories.fromJson(Map<String, dynamic> json) => _$FilterCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$FilterCategoriesToJson(this);

}

@JsonSerializable()
class FilterCategoryItem {
  String strDrink;
  String strDrinkThumb;
  String idDrink;
  @JsonKey(ignore: true)
  bool isFavorite;

  FilterCategoryItem({this.strDrink, this.strDrinkThumb, this.idDrink, this.isFavorite = false});

  @override
  String toString() {
    return 'FilterCategoryItem{strDrink: $strDrink, strDrinkThumb: $strDrinkThumb, idDrink: $idDrink}';
  }

  factory FilterCategoryItem.fromJson(Map<String, dynamic> json) => _$FilterCategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$FilterCategoryItemToJson(this);

}