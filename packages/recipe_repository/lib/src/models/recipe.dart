// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';

class Recipe extends Equatable {
  const Recipe({required this.thumbnailUrl});

  factory Recipe.fromApi(Meals meals) {
    final meal = meals.meals.first;
    return Recipe(thumbnailUrl: meal.strMealThumb);
  }

  final String thumbnailUrl;

  @override
  List<Object?> get props => [thumbnailUrl];
}
