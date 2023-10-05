import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:speso_code/screens/dashboard.dart';
import 'package:speso_code/util/route_navigators.dart';

import '../util/dimension.dart';

class SplashScreen extends StatefulHookWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash.screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    initialAction();
    super.initState();
  }

  Future<Timer> initialAction() async {
    return Timer(
      const Duration(seconds: 3),
      () {
        screenToDisplay();
      },
    );
  }

  void screenToDisplay() async {
    RouteNavigators.routeReplace(context, const BottomNavBarDashboard());
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    late final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF6F5DE7),
      body: Center(
        child: SizedBox(
          height: getScreenHeight(250),
          width: getScreenWidth(250),
          child: ScaleTransition(
            scale: animation,
            child: Image.asset(
              'assets/images/spasologo-removebg-preview.png',
              height: getScreenHeight(200),
              width: getScreenWidth(200),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
