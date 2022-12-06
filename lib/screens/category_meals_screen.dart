import 'package:flutter/material.dart';
import '../widgets/meal_item_widget.dart';
import '../models/meal_model.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late String categoryId;
  late Color color;
  late List<Meal> displayMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //  ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;

      categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      color = routeArgs['color'];

      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.retainWhere((meal) => meal.id != mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
