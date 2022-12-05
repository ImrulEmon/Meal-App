import 'package:flutter/material.dart';
import '../widgets/main_drawer_widget.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MainDrawerWidget(),
      body: Center(
        child: Text(
          'Filter Screen',
        ),
      ),
    );
  }
}
