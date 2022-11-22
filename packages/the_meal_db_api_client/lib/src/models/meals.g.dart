// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meals _$MealsFromJson(Map<String, dynamic> json) => Meals(
      (json['meals'] as List<dynamic>)
          .map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsToJson(Meals instance) => <String, dynamic>{
      'meals': instance.meals,
    };
