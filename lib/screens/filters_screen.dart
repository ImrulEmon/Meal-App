import 'package:flutter/material.dart';
import '../widgets/main_drawer_widget.dart';
import '../constants/ml_constants.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile({
    required String title,
    required String description,
    required bool currentValue,
    required Function(bool) updateValue,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MainDrawerWidget(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(paddingDft),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                title: 'Gluten-free',
                description: 'Only include gluten-free meals',
                currentValue: _glutenFree,
                updateValue: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                title: 'Vegeterian',
                description: 'Only include vegeterian meals',
                currentValue: _vegetarian,
                updateValue: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                title: 'Vegane',
                description: 'Only include vegan meals',
                currentValue: _vegan,
                updateValue: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                title: 'Lactose-free',
                description: 'Only include loctose-free meals',
                currentValue: _lactoseFree,
                updateValue: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
