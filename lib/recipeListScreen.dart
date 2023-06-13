// ignore: file_names
import 'package:flutter/material.dart';
import 'package:fluttertest1/recipe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertest1/recipeScreen.dart';

class RecipeListScreen extends StatelessWidget {
  RecipeListScreen({super.key});
  final List<Recipe> recipes = [
    Recipe(
        "Pizza Widget",
        "Par Maxime Martrat",
        "https://images.pexels.com/photos/5792329/pexels-photo-5792329.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Préparer une pâte à pizza ou l'acheter toute faite. Étaler la pâte et la recouvrir d'huile d'olive. Couper les tomates en rondelles, la mozzarella en cubes et le jambon en petits carrés. Éplucher l'oignon et les champignons. Les hacher finement. Recouvrir la pâte de sauce tomate, des tomates et de la mozzarella. Disposer le jambon, les champignons et les oignons. Assaisonner d'huile d'olive, de sel, de poivre, d'herbes de Provence, de thym, de persil... Faire cuire au four à 200°C pendant environ 30 minutes jusqu'à ce qu'elle soit bien dorée.",
        false,
        50),
    Recipe(
        "Burger de folie",
        "Par Cyril Lignac",
        "https://images.pexels.com/photos/2983104/pexels-photo-2983104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Préchauffez votre four à 180°C.Emincez les oignons et faites-les revenir à feu moyen dans l'huile. Baissez le feu, salez, poivrez et laissez confire 20 minutes. Coupez les buns en deux en enfournez-les 3 minutes. Faites revenir les lardons. Façonnez les steaks, salez, poivrez puis laissez-les saisir 1 minute sur chaque face. Sur les buns, posez les oignons, un steak, une tranche de reblochon et les lardons. Enfournez 2-3 minutes. Avant de servir, répartissez la salade puis refermez le burger tartiflette.",
        true,
        50),
    Recipe(
        "Pizza Gourmande",
        "Par Pierre Gagnaire",
        "https://images.pexels.com/photos/2471171/pexels-photo-2471171.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Préchauffez votre four à 220°C. Étalez la pâte à pizza sur une plaque. Étalez la sauce tomate sur la pâte. Ajoutez des tranches de pepperoni, des champignons, des olives noires et du fromage râpé. Enfournez la pizza pendant 12 à 15 minutes ou jusqu'à ce que le fromage soit fondu et doré. Sortez la pizza du four, garnissez de basilic frais et dégustez !",
        false,
        12),
    Recipe(
        "Poulet à la Provençale",
        "Par Anne-Sophie Pic",
        "https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Dans une poêle, faites dorer les morceaux de poulet dans de l'huile d'olive. Ajoutez de l'ail émincé, des tomates coupées en dés, des olives noires, du thym et du romarin. Laissez mijoter à feu doux pendant 30 minutes. Servez le poulet à la Provençale avec du riz ou des pommes de terre sautées.",
        false,
        42),
    Recipe(
        "Pâtes Carbonara",
        "Par Hélène Darroze",
        "https://images.pexels.com/photos/5710178/pexels-photo-5710178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Faites cuire les pâtes dans de l'eau bouillante salée selon les instructions sur l'emballage. Pendant ce temps, faites revenir des lardons dans une poêle. Dans un bol, battez des jaunes d'œufs avec du parmesan râpé. Égouttez les pâtes cuites et ajoutez-les dans la poêle avec les lardons. Retirez du feu et incorporez le mélange d'œufs et de parmesan. Remuez rapidement pour enrober les pâtes. Servez chaud avec une pincée de poivre noir.",
        true,
        64),
    Recipe(
        "Côte de bœuf à la Bordelaise",
        "Éric Ripert",
        "https://plus.unsplash.com/premium_photo-1668616816720-c293b5f4debd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
        "Préchauffez votre grill à haute température. Assaisonnez la côte de bœuf avec du sel et du poivre. Faites griller la côte de bœuf pendant 4 à 6 minutes de chaque côté pour une cuisson saignante. Retirez la viande du grill et laissez reposer pendant quelques minutes. Servez la côte de bœuf avec une sauce bordelaise maison, des pommes de terre rôties et des légumes de saison.",
        true,
        25)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mes recettes"),
        ),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeItemWidget(recipe: recipes[index]);
            }));
  }
}

class RecipeItemWidget extends StatelessWidget {
  const RecipeItemWidget({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    RecipeScreen(recipe: recipe),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    animation = CurvedAnimation(curve: Curves.ease, parent: animation);
                    return FadeTransition(
                      opacity:animation,
                      child: child,
                    );
                }
            )
        );
      },
      child: Card(
          margin: const EdgeInsets.all(8),
          elevation: 8,
          child: Row(
            children: [
              Hero(
                tag: "imageRecipe${recipe.title}",
                child: CachedNetworkImage(
                  imageUrl: recipe.imageUrl,
                  placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(recipe.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    Text(recipe.user,
                        style: TextStyle(color: Colors.grey[500], fontSize: 16))
                  ], //children column
                ),
              )
            ], //children row
          )),
    );
  } //build
}
