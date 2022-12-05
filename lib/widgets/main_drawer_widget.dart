import 'package:flutter/material.dart';
import '../constants/ml_constants.dart';
import '../screens/filters_screen.dart';

class MainDrawerWidget extends StatefulWidget {
  const MainDrawerWidget({super.key});

  @override
  State<MainDrawerWidget> createState() => _MainDrawerWidgetState();
}

class _MainDrawerWidgetState extends State<MainDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(paddingDft),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: paddingDft),
          buildListTileWidget(
            title: 'Meals',
            icon: Icons.restaurant,
            tapHandler: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTileWidget(
            title: 'Filters',
            icon: Icons.settings,
            tapHandler: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
          // buildListTileWidget(),
        ],
      ),
    );
  }

// ========= Drawer List tile widget ============  //
  buildListTileWidget({
    required String title,
    required IconData icon,
    required Function() tapHandler,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
