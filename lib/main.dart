import 'package:flutter/material.dart';
import 'screens/filters_screen.dart';
import 'package:meal_app/screens/home_tabs_bottom_screen.dart';
import 'screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/error404_screen.dart';
// ignore: unused_import
import 'screens/alt_home_tabs_top_screen.dart';
import './database/dummy_data.dart';
import './models/meal_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/', //default value is '/' - change it with other route
      routes: {
        // '/': (ctx) => const AltHomeTabsTopScreen(),
        '/': (ctx) => const HomeTabsBottomScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        // print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => const Error404Screen()),
    );
  }
}
