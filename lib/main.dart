import 'package:flutter/material.dart';

void main() {
  runApp(const Quest());
}

class Quest extends StatelessWidget {
  const Quest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'quest',
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
