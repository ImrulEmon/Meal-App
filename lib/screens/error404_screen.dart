import 'package:flutter/material.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Opps...',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text('Something Went Wrong!!'),
      ),
    );
  }
}
