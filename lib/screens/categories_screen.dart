import 'package:flutter/material.dart';
import '../database/dummy_data.dart';
import '../widgets/category_item_widget.dart';
import '../constants/ml_constants.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal App'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(paddingDft),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: paddingDft,
          mainAxisSpacing: paddingDft,
        ),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItemWidget(
              id: category.id, title: category.title, color: category.color);
        }).toList(),
      ),
    );
  }
}
