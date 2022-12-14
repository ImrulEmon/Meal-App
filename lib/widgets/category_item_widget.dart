import 'package:flutter/material.dart';
import 'package:meal_app/constants/ml_constants.dart';
import '../screens/category_meals_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItemWidget(
      {super.key, required this.title, required this.color, required this.id});

  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(paddingDft),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(paddingDft),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(paddingDft),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
