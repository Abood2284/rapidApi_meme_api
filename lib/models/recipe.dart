import 'package:flutter/material.dart';

class Recipe {
  String title;
  double rating;
  String cookTime;
  String thumbNailUrl;

  Recipe({
    @required this.title,
    @required this.rating,
    @required this.cookTime,
    @required this.thumbNailUrl,
  });

// Create single object of Recipe from json
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        title: json['name'] as String,
        rating: json['rating'] as double,
        cookTime: json['totalTime'] as String,
        thumbNailUrl: json['images'][0]['hostedLargeUrl'] as String);
  }

// Convert list of data into recipe object
// First list of json data fetched from API will store here, and one by one data which is in json
// will be converted to Dart Object by Recipe.fromJson
  static List<Recipe> recipeFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $title, image: $thumbNailUrl, rating: $rating, totalTime: $cookTime}';
  }
}
