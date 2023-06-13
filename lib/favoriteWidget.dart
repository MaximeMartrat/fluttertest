// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favoriteChangeNotifier.dart';

class FavoriteIconWidget extends StatefulWidget {
  const FavoriteIconWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
} // class FavoriteWidget

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  late bool _isFavorited;

  void _toggleFavorite(FavoriteChangeNotifier notifier) {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }

      notifier.isFavorited = _isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier notifier =
        Provider.of<FavoriteChangeNotifier>(context);
    _isFavorited = notifier.isFavorited;
    return IconButton(
      icon: _isFavorited
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
      color: Colors.red,
      onPressed: ()=>_toggleFavorite(notifier),
    );
  } // build
} // _FavoriteWidgetState

class FavoriteTextWidget extends StatefulWidget {
  const FavoriteTextWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
} // class FavoriteWidget

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChangeNotifier>(
      builder: (context, notifier, _) => Text(notifier.favoritedCount.toString()));
  } // build
}
