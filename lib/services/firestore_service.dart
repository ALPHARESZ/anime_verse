import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/anime.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection reference
  CollectionReference _userCollection() {
    return _firestore.collection('users');
  }

  // Get favorites stream
  Stream<List<Anime>> getFavoritesStream(String userId) {
    return _userCollection()
    .doc(userId)
    .collection('favorites')
    .snapshots()
    .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Anime.fromFavoritesJson(doc.data());
      }).toList();
    });
  }

  // Add favotite
  Future<void> addFavorite(String userId, Anime anime) async {
    await _userCollection()
      .doc(userId)
      .collection('favorites')
      .doc(anime.malId.toString())
      .set(anime.toJson());
  }

  // Remove favotite
  Future<void> removeFavorit(String userId, int animeId) async {
    await _userCollection()
      .doc(userId)
      .collection('favorites')
      .doc(animeId.toString())
      .delete();
  }


}