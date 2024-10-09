import 'package:flutter/material.dart';

void main() {
  runApp(const Scarpit());
}

class Scarpit extends StatelessWidget {
  const Scarpit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
