// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// {@template receipe_repository}
/// recepie repo
/// {@endtemplate}
///
import 'package:receipe_repository/src/models/recipe.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';

///Receipe Repositiory
class RecipeRepository {
  /// {@macro receipe_repository}
  const RecipeRepository(this._mealDbApiClient);

  final TheMealDbApiClient _mealDbApiClient;

  ///Returns a random [Recipe] if the api call succeeds,
  ///or throws an exception if the call fails
  Future<Recipe> getRandomRecipe() async {
    try {
      final recipe = await _mealDbApiClient.fetchRandomMeal();
      print(Recipe.fromApi(recipe)); 
      return Recipe.fromApi(recipe);
    } catch (_) {
      rethrow;
    }
  }
}
