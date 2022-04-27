class Recipe {
  String title;
  String rating;
  String cookTime;
  String thumbNailUrl;

  Recipe({
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbNailUrl,
  });

// Create single object of Recipe from json
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        title: json['name'],
        rating: json['rating'],
        cookTime: json['totalTime'],
        thumbNailUrl: json['images'][0]['hostedLargeUrl']);
  }

// Convert list of data into recipe object
// First list of json data fetched from API will store here, and one by one data which is in json
// will be converted to Dart Object by Recipe.fromJson
  static List<Recipe> recipeFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}
