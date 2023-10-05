import 'package:flutter/material.dart';
import 'dimension.dart';

class Padded extends StatelessWidget {
  const Padded({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(25),
      ),
      child: child,
    );
  }
}
