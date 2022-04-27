import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    // creating the url
    // All this information was retrieved from rapidApi.com code snippets
    // first is the authority the url
    // the path
    // and the limit -> for how many recipe you wanna fetch {here 24}
    var uri = Uri.https(
      'yummly2.p.rapidapi.com',
      '/feeds/list',
      {"limit": '24', "start": '0'},
    );

// header is optional though it was provided by rapidApi.com so we added it too
// wating for the URL response
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'X-RapidAPI-Key': 'ad8053f3a4msh52c29e3a64e53cap1e3bf8jsn5e1d9e9acaa0'
    });

    Map data = jsonDecode(response.body);
    // We have to create a temporay list that will store the json decoded recipe
    // it will pass this list to the factory which will convert to Dart object
    List _temp = [];
    // SInce the 'feed' is array which holds mulitple recipe,
    // also we need only specific information from the array  i.e:-> only details key in the contents key
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    // RETURNING DART CONVERTED RECIPE
    return Recipe.recipeFromSnapshot(_temp);
  }
}
