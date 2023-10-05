import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speso_code/screens/splash.dart';
import 'package:speso_code/util/color.dart';
import 'package:speso_code/util/dimension.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 0.5,
        style: BorderStyle.none,
        color: kSECCOLOUR,
      ),
    );
    return MaterialApp(
      title: 'Speso Coding Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromRGBO(243, 243, 231, 1),
          inputDecorationTheme: InputDecorationTheme(
            border: outlineInputBorder,
          )),
      home: const SplashScreen(),
    );
  }
}
