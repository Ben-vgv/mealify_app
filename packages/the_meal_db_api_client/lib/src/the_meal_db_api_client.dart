// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// {@template the_meal_db_api_client}
/// meal_db_api
/// {@endtemplate}
/// import 'dart:convert';
///

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_meal_db_api_client/src/models/meal.dart';
import 'package:the_meal_db_api_client/src/models/meals.dart';

// ignore: public_member_api_docs
class TheMealDbApiClient {
  // ignore: public_member_api_docs
  TheMealDbApiClient({
    this.mealUrl = 'https://www.themealdb.com/api/json/v1/1/random.php',
    required this.client,
  });

  final String mealUrl;
  final http.Client client;

  Future<Meal> fetchRandomMeal() async {
    final response = await client.get(Uri.parse(mealUrl));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return Meals.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
