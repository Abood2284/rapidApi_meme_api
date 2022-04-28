import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';
import '../models/recipe.dart';
import '../Data/recipe_api.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // To store the Dart converted Recipe and Display to the user
//   List<Recipe> _recipes;
//   bool _isLoaing = true;

//   @override
//   void initState() {
//     super.initState();
//     // Future Method call
//     getRecipe();
//   }

// // It fetches the Dart converted Recipe object and stores in _recipes List
// // Also sets Loading to false
//   Future<void> getRecipe() async {
//     _recipes = await RecipeApi.getRecipe();
//     setState(() {
//       _isLoaing = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(Icons.restaurant_menu),
//               SizedBox(width: 10),
//               Text('Food Recipes'),
//             ],
//           ),
//         ),
//         body: _isLoaing
//             ? const Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: _recipes.length,
//                 itemBuilder: (ctx, index) {
//                   return RecipeCard(
//                       title: _recipes[index].title,
//                       cookTime: _recipes[index].cookTime,
//                       rating: _recipes[index].rating as String,
//                       thumbnailUrl: _recipes[index].thumbNailUrl);
//                 }));
//   }
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].title,
                      cookTime: _recipes[index].cookTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].thumbNailUrl);
                },
              ));
  }
}
