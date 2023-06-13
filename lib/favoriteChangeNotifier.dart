import 'package:flutter/material.dart';

class FavoriteChangeNotifier with ChangeNotifier {
  bool _isFavorited;
  final int _favoritedCount;

  FavoriteChangeNotifier(this._isFavorited, this._favoritedCount);

  bool get isFavorited => _isFavorited;

  int get favoritedCount => _favoritedCount + (_isFavorited ? 1 : 0);

  set isFavorited(bool isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}
