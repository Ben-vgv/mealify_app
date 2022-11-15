// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_meal_db_api_client/src/models/meals.dart';

class TheMealDbApiClient {
  TheMealDbApiClient({
    this.mealUrl = 'https://www.themealdb.com/api/json/v1/1/random.php',
    required this.client,
  });

  final String mealUrl;
  final http.Client client;

  Future<Meals> fetchRandomMeal() async {
    final response = await client.get(Uri.parse(mealUrl));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return Meals.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
