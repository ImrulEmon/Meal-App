import 'package:flutter/material.dart';

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
        children: [Container()],
      ),
    );
  }
}
