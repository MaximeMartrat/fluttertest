// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest1/favoriteChangeNotifier.dart';
import 'package:provider/provider.dart';
import 'favoriteWidget.dart';
import 'recipe.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    Widget titleSelection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(recipe.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25)),
                ),
                Text(recipe.user,
                    style: const TextStyle(color: Colors.grey, fontSize: 16)),
              ], // children Column
            ),
          ),
          const FavoriteIconWidget(),
          const FavoriteTextWidget(),
        ], // children Row
      ),
    );

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.comment, "COMMENTAIRES"),
          _buildButtonColumn(Colors.blue, Icons.share, "PARTAGER"),
        ], // children Row
      ),
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(
          recipe.isFavorite, recipe.favoriteCount),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Recettes"),
        ),
        body: ListView(
          children: [
            Hero(
              tag: "imageRecipe${recipe.title}",
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                placeholder: (context, url) => const Center(child:CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            titleSelection,
            buttonSection,
            descriptionSection
          ]
        )
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ], //children Column
    );
  } //buildButtonColumn
} // RecipeScreen
