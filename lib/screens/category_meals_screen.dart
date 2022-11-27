import 'package:flutter/material.dart';
import '../database/dummy_data.dart';

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

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
