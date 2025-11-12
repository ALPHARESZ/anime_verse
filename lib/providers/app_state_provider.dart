import 'package:flutter/material.dart';
import 'package:anime_verse/models/anime.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateProvider extends ChangeNotifier{
  List<Anime> _favorites = [];
  List<Anime> get favorites => _favorites;
  static const String _storageKey = 'favorite_anime_list';
  
  bool isFavorite(String animeId){
    return _favorites.any((anime) => anime.id == animeId);
  }

  void toggleFavorite(Anime anime){
    if (isFavorite(anime.id)){
      revomeFavorite(anime.id);
    } else {
      addFavorite(anime);
    }
  }

  void addFavorite(Anime anime){
    if (!isFavorite(anime.id)){
      _favorites.add(anime);
      _saveFavorites();
      notifyListeners();
    }
  }

  void revomeFavorite(String animeId){
    _favorites.removeWhere((anime) => anime.id == animeId);
    _saveFavorites();
    notifyListeners();
  }

  /// Load favorites from SharedPreferences
  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? favoritesJson = prefs.getString(_storageKey);
      
      if (favoritesJson != null) {
        final List<dynamic> decoded = json.decode(favoritesJson);
        _favorites = decoded.map((item) {
          return Anime(
            id: item['id'],
            title: item['title'],
            imagePath: item['imagePath'],
            genre: item['genre'],
            rating: item['rating'],
            totalEpisodes: item['totalEpisodes'],
            description: item['description'],
          );
        }).toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  /// Save favorites to SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> favoritesJson = _favorites.map((anime) {
        return {
          'id': anime.id,
          'title': anime.title,
          'imagePath': anime.imagePath,
          'genre': anime.genre,
          'rating': anime.rating,
          'totalEpisodes': anime.totalEpisodes,
          'description': anime.description,
        };
      }).toList();
      
      await prefs.setString(_storageKey, json.encode(favoritesJson));
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }
}