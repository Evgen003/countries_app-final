import 'dart:async';

abstract class FavouritesServiceInterface {
  Future<void> addFavorite({
    required String capital,
    required String code,
    required String callingCode,
    required List currencyCodes,
    required String flagImageUri,
    required String name,
    required int numRegions,
    required String wikiDataId,
  });

  Future<List<Map<String, dynamic>>> getFavorites();

  Future<void> deleteFavorite(String id);

  //Future<bool> isFavorite(String id);
}
