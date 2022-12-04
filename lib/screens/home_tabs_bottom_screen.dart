import 'package:flutter/material.dart';
import './favourite_screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawer_widget.dart';

class HomeTabsBottomScreen extends StatefulWidget {
  const HomeTabsBottomScreen({super.key});

  @override
  State<HomeTabsBottomScreen> createState() => _HomeTabsBottomScreenState();
}

class _HomeTabsBottomScreenState extends State<HomeTabsBottomScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': const FavouriteScreen(),
      'title': 'Favourites',
    }
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WB-${_pages[_selectedPageIndex]['title']}"),
      ),
      drawer: MainDrawerWidget(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }
}
