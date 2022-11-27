import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;

    final mealItemDetail = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(mealItemDetail),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text("This is-$mealItemDetail-details page"),
          ),
        ],
      ),
    );
  }
}
