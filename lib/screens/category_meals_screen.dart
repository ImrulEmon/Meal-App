import 'package:flutter/material.dart';
import '../database/dummy_data.dart';
import '../widgets/meal_item_widget.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

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
        backgroundColor: color,
        centerTitle: true,
        title: Text(categoryTitle),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItemWidget(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
