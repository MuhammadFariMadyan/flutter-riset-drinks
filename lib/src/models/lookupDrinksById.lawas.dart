// To parse this JSON data, do
//
//     final lookupDrinksById = lookupDrinksByIdFromJson(jsonString);

import 'dart:convert';

LookupDrinksById lookupDrinksByIdFromJson(String str) => LookupDrinksById.fromJson(json.decode(str));

String lookupDrinksByIdToJson(LookupDrinksById data) => json.encode(data.toJson());

class LookupDrinksById {
    List<Map<String, String>> drinks;

    LookupDrinksById({
        this.drinks,
    });

    factory LookupDrinksById.fromJson(Map<String, dynamic> json) => LookupDrinksById(
        drinks: List<Map<String, String>>.from(json["drinks"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}
