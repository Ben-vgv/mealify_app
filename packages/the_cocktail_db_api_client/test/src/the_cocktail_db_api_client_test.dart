// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:the_cocktail_db_api_client/the_cocktail_db_api_client.dart';

void main() {
  group('TheCocktailDbApiClient', () {
    test('can be instantiated', () {
      expect(TheCocktailDbApiClient(), isNotNull);
    });
  });
}
