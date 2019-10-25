// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filterCategories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterCategories _$FilterCategoriesFromJson(Map<String, dynamic> json) {
  return FilterCategories(
    filterCategoryItems: (json['drinks'] as List)
        ?.map((e) => e == null
            ? null
            : FilterCategoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FilterCategoriesToJson(FilterCategories instance) =>
    <String, dynamic>{
      'drinks': instance.filterCategoryItems,
    };

FilterCategoryItem _$FilterCategoryItemFromJson(Map<String, dynamic> json) {
  return FilterCategoryItem(
    strDrink: json['strDrink'] as String,
    strDrinkThumb: json['strDrinkThumb'] as String,
    idDrink: json['idDrink'] as String,
  );
}

Map<String, dynamic> _$FilterCategoryItemToJson(FilterCategoryItem instance) =>
    <String, dynamic>{
      'strDrink': instance.strDrink,
      'strDrinkThumb': instance.strDrinkThumb,
      'idDrink': instance.idDrink,
    };
