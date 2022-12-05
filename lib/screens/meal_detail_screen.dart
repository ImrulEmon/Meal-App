import 'package:flutter/material.dart';

import '../database/dummy_data.dart';
import '../constants/ml_constants.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = '/meal-detail';

  Widget buildSectionTitleWidget(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: paddingDft / 2),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }

  Widget buildContainerWidget({required Widget child}) {
    return Container(
      margin: const EdgeInsets.all(paddingDft / 2),
      padding: const EdgeInsets.all(paddingDft),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 160,
      width: 320,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;

    final mealItemDetail = routeArgs['title'];
    final mealId = routeArgs['id'];

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealItemDetail,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitleWidget(context, "Ingridients"),
            buildContainerWidget(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: paddingDft / 2,
                      horizontal: paddingDft,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitleWidget(context, "Steps"),
            buildContainerWidget(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    if (index != 0)
                      const Divider(
                        color: Colors.grey,
                        thickness: .8,
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.local_fire_department),
      ),
    );
  }
}
