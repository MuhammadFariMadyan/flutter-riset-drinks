import 'dart:convert';

// data model list categories

ListCategories categoriesFromJson(String str) => ListCategories.fromJson(json.decode(str));

String categoriesToJson(ListCategories data) => json.encode(data.toJson());


class ListCategories {
  String strCategory;
  String imagePath;

  ListCategories({
    this.strCategory = '',
    this.imagePath = '',
  });

  factory ListCategories.fromJson(Map<String, dynamic> json) => ListCategories(
        imagePath: json["imagePath"],
        strCategory: json["strCategory"],
    );

    Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "strCategory": strCategory,
    };

  static var listCategoriesJson = [
    {
      "imagePath": "assets/images/beer_category.jpg",
      "strCategory": "Beer"
    },
    {
      "imagePath": "assets/images/cocoa_category.jpg",
      "strCategory": "Cocoa"
    },
    {
      "imagePath": "assets/images/coffe_or_tea_category.jpg",
      "strCategory": "Coffee / Tea"
    },
    {
      "imagePath": "assets/images/cocktail_category.jpg",
      "strCategory": "Cocktail"
    },
    {
      "imagePath": "assets/images/homemade_liqueur_category.jpg",
      "strCategory": "Homemade Liqueur"
    },
    {
      "imagePath": "assets/images/milk_float_shake_category.jpg",
      "strCategory": "Milk / Float / Shake"
    },
    {
      "imagePath": "assets/images/ordinary_drink_category.jpg",
      "strCategory": "Ordinary Drink"
    },
    {
      "imagePath": "assets/images/other_unknown_category.jpg",
      "strCategory": "Other/Unknown"
    },
    {
      "imagePath": "assets/images/punch_party_drink_category.jpg",
      "strCategory": "Punch / Party Drink"
    },
    {
      "imagePath": "assets/images/soft_drink_soda_category.jpg",
      "strCategory": "Soft Drink / Soda"
    },
    {
      "imagePath": "assets/images/shot_category.jpg",
      "strCategory": "Shot"
    },
  ];

 static List<ListCategories> listCategoriesList = [
    ListCategories(
        imagePath: 'assets/images/beer_category.jpg',
        strCategory: 'Beer',
    ),
    ListCategories(
      imagePath: 'assets/images/cocoa_category.jpg',
      strCategory: 'Cocoa',
    ),
    ListCategories(
      imagePath: 'assets/images/coffe_or_tea_category.jpg',
      strCategory: 'Coffee / Tea',
    ),
    ListCategories(
      imagePath: 'assets/images/cocktail_category.jpg',
      strCategory: 'Cocktail',
    ),
    ListCategories(
      imagePath: 'assets/images/homemade_liqueur_category.jpg',
      strCategory: 'Homemade Liqueur',
    ),
    ListCategories(
      imagePath: 'assets/images/milk_float_shake_category.jpg',
      strCategory: 'Milk / Float / Shake',
    ),
    ListCategories(
      imagePath: 'assets/images/ordinary_drink_category.jpg',
      strCategory: 'Ordinary Drink',
    ),
    ListCategories(
      imagePath: 'assets/images/other_unknown_category.jpg',
      strCategory: 'Other/Unknown',
    ),
    ListCategories(
      imagePath: 'assets/images/punch_party_drink_category.jpg',
      strCategory: 'Punch / Party Drink',
    ),
    ListCategories(
      imagePath: 'assets/images/soft_drink_soda_category.jpg',
      strCategory: 'Soft Drink / Soda',
    ),
    ListCategories(
      imagePath: 'assets/images/shot_category.jpg',
      strCategory: 'Shot',
    ),
  ];

}
