import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  // final String id;
  // final String categoryTitle;
  // final Color color;
  // const CategoryMealsScreen(
  //     {super.key,
  //     required this.categoryTitle,
  //     required this.color,
  //     required this.id});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final color = routeArgs['color'];

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle),
        elevation: 0,
      ),
      body: Center(
        child: Text('$categoryId : The Recepies for the $categoryTitle!'),
      ),
    );
  }
}
