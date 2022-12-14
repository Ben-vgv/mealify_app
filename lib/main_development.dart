// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:mealify_app/app/app.dart';
import 'package:mealify_app/bootstrap.dart';
import 'package:receipe_repository/recipe_repository.dart';

void main() {
  bootstrap(
    (RecipeRepository recipeRepository) => App(
      recipeRepository: recipeRepository,
    ),
  );
}
