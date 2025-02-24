import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:countries_app/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouritesService extends FavouritesServiceInterface {
  FavouritesService({required this.dio});
  final Dio dio;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');

  @override
  Future<void> addFavorite({
    required String capital,
    required String code,
    required String callingCode,
    required List currencyCodes,
    required String flagImageUri,
    required String name,
    required int numRegions,
    required String wikiDataId,
  }) async {
    try {
      await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .doc(wikiDataId)
          .set({
        'capital': capital,
        'code': code,
        'callingCode': callingCode,
        'currencyCodes': currencyCodes,
        'flagImageUri': flagImageUri,
        'name': name,
        'numRegions': numRegions,
        'wikiDataId': wikiDataId,
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getFavorites() async {
    try {
      QuerySnapshot snapshot = await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .get();
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<void> deleteFavorite(String id) async {
    try {
      await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .doc(id)
          .delete();
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  // @override
  // Future<bool> isFavorite(String id) async {
  //   List<Map<String, dynamic>> favorites = await getFavorites();
  //   return favorites.any((favorite) => favorite['id'] == id);
  // }
}
