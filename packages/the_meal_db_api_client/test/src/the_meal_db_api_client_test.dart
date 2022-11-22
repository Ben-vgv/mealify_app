// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';

// import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';
class MockClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  late http.Client _http;
  late http.Response _response;
  late TheMealDbApiClient _client;

  setUp(() {
    _http = MockClient();
    _response = MockResponse();
    _client = TheMealDbApiClient(client: _http);
    registerFallbackValue(Uri.parse('/random.php'));
  });

  group('TheMealDbApiClient', () {
    group('fetchRandomMeal', () {
      test('return meals on proper API call', () async {
        when(() => _response.body).thenReturn(_rawJsonResponse);
        when(() => _response.statusCode).thenReturn(200);
        when(() => _http.get(any())).thenAnswer((_) async => _response);
        final result = await _client.fetchRandomMeal();

        expect(
            result,
            Meals.fromJson(
                jsonDecode(_rawJsonResponse) as Map<String, dynamic>));
      });

      test('throws exception when http returns non ok response', () async {
        when(() => _response.statusCode).thenReturn(404);
        when(() => _response.body).thenReturn('not found');
        when(() => _http.get(any())).thenAnswer((_) async => _response);
        

        expect(()=> _client.fetchRandomMeal(), throwsA(isA<Exception>()));
      });
    });
  });
}

const _rawJsonResponse = '''
{
  "meals": [
    {
      "idMeal": "52936",
      "strMeal": "Saltfish and Ackee",
      "strDrinkAlternate": null,
      "strCategory": "Seafood",
      "strArea": "Jamaican",
      "strInstructions": "For the saltfish, soak the salt cod overnight, changing the water a couple of times.",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/vytypy1511883765.jpg",
      "strTags": "Speciality",
      "strYoutube": "https://www.youtube.com/watch?v=nbfNyZbdn2I",
      "strIngredient1": "Salt Cod",
      "strIngredient2": "Ackee",
      "strIngredient3": "Onion",
      "strIngredient4": "Paprika",
      "strIngredient5": "Curry Powder",
      "strIngredient6": "Jerusalem Artichokes",
      "strIngredient7": "Hotsauce",
      "strIngredient8": "Red Pepper",
      "strIngredient9": "Yellow Pepper",
      "strIngredient10": "Tomatoes",
      "strIngredient11": "Salt",
      "strIngredient12": "Pepper",
      "strIngredient13": "Self-raising Flour",
      "strIngredient14": "Suet",
      "strIngredient15": "Salt",
      "strIngredient16": "Olive Oil",
      "strIngredient17": "",
      "strIngredient18": "",
      "strIngredient19": "",
      "strIngredient20": "",
      "strMeasure1": "450g",
      "strMeasure2": "400g",
      "strMeasure3": "1 chopped",
      "strMeasure4": "1 tsp ",
      "strMeasure5": "2 tsp",
      "strMeasure6": "2 tsp",
      "strMeasure7": "1 tsp ",
      "strMeasure8": "1 sliced",
      "strMeasure9": "1 sliced",
      "strMeasure10": "200g",
      "strMeasure11": "to taste",
      "strMeasure12": "to taste",
      "strMeasure13": "250g",
      "strMeasure14": "30g",
      "strMeasure15": "pinch",
      "strMeasure16": "for frying",
      "strMeasure17": "",
      "strMeasure18": "",
      "strMeasure19": "",
      "strMeasure20": "",
      "strSource": "https://www.bbc.co.uk/food/recipes/saltfish__ackee_with_64803",
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    }
  ]
}
''';
