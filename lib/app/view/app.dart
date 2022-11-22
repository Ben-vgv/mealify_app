// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealify_app/l10n/l10n.dart';
import 'package:receipe_repository/recipe_repository.dart';

class App extends StatelessWidget {
  const App({required RecipeRepository recipeRepository, super.key})
      : _recipeRepository = recipeRepository;

  final RecipeRepository _recipeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _recipeRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home:  Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_recipeRepository.getRandomRecipe().toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
