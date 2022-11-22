// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:receipe_repository/recipe_repository.dart';
import 'package:receipe_repository/src/models/recipe.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';

// import 'package:receipe_repository/receipe_repository.dart';

class MockMealDbApiClient extends Mock implements TheMealDbApiClient {}

void main() {
  late TheMealDbApiClient _theMealDbiApi;
  late RecipeRepository _recipieRepository;

  setUp(() {
    _theMealDbiApi = MockMealDbApiClient();
    _recipieRepository = RecipeRepository(_theMealDbiApi);
  });

  group('ReceipeRepository', () {
    group('get random recipe', () {
      test('returns recipe when api calls succeed', () async {
        when(() => _theMealDbiApi.fetchRandomMeal())
            .thenAnswer((_) async => _meals);
        final result = await _recipieRepository.getRandomRecipe();
        expect(result, Recipe.fromApi(_meals));
      });

      test('throws Could not fetch meal exception if API call fails', () {
        when(() => _theMealDbiApi.fetchRandomMeal()).thenThrow(Exception());
        expect(
          () => _recipieRepository.getRandomRecipe(),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}

final _meals = Meals([
  Meal(
    idMeal: 'idMeal',
    strMeal: 'strMeal',
    strDrinkAlternate: 'strDrinkAlternate',
    strCategory: 'strCategory',
    strInstructions: 'strInstructions',
    strMealThumb: 'strMealThumb',
    strTags: 'strTags',
    strYoutube: 'strYoutube',
    strIngredient1: 'strIngredient1',
    strIngredient2: 'strIngredient2',
    strIngredient3: 'strIngredient3',
    strIngredient4: 'strIngredient4',
    strIngredient5: 'strIngredient5',
    strIngredient6: 'strIngredient6',
    strIngredient7: 'strIngredient7',
    strIngredient8: 'strIngredient8',
    strIngredient9: 'strIngredient9',
    strIngredient10: 'strIngredient10',
    strIngredient11: 'strIngredient11',
    strIngredient12: 'strIngredient12',
    strIngredient13: 'strIngredient13',
    strIngredient14: 'strIngredient14',
    strIngredient15: 'strIngredient15',
    strIngredient16: 'strIngredient16',
    strIngredient17: 'strIngredient17',
    strIngredient18: 'strIngredient18',
    strIngredient19: 'strIngredient19',
    strIngredient20: 'strIngredient20',
    strMeasure1: 'strMeasure1',
    strMeasure2: 'strMeasure2',
    strMeasure3: 'strMeasure3',
    strMeasure4: 'strMeasure4',
    strMeasure5: 'strMeasure5',
    strMeasure6: 'strMeasure6',
    strMeasure7: 'strMeasure7',
    strMeasure8: 'strMeasure8',
    strMeasure9: 'strMeasure9',
    strMeasure10: 'strMeasure10',
    strMeasure11: 'strMeasure11',
    strMeasure12: 'strMeasure12',
    strMeasure13: 'strMeasure13',
    strMeasure14: 'strMeasure14',
    strMeasure15: 'strMeasure15',
    strMeasure16: 'strMeasure16',
    strMeasure17: 'strMeasure17',
    strMeasure18: 'strMeasure18',
    strMeasure19: 'strMeasure19',
    strMeasure20: 'strMeasure20',
    strSource: 'strSource',
    strImageSource: 'strImageSource',
    strCreativeCommonsConfirmed: 'strCreativeCommonsConfirmed',
    dateModified: DateTime.now(),
  )
]);
