import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home of Food Pirate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavouriteScreen(),
        ]),
      ),
    );
  }
}
