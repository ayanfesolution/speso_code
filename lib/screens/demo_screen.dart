import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
