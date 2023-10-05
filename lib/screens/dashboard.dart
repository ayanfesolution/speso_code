import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speso_code/screens/chat.dart';
import 'package:speso_code/screens/custom_bottom_bar.dart';
import 'package:speso_code/screens/demo_screen.dart';

class BottomNavBarDashboard extends StatefulHookConsumerWidget {
  const BottomNavBarDashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavBarDashboardState();
}

class _BottomNavBarDashboardState extends ConsumerState<BottomNavBarDashboard> {
  @override
  Widget build(BuildContext context) {
    var indexToShow = useState(0);
    var listOfWidget = [
      const DemoScreen(title: 'Services'),
      const DemoScreen(title: 'Scan'),
      const CartScreen(),
      const DemoScreen(title: 'Me'),
    ];
    return Scaffold(
      body: listOfWidget[indexToShow.value],
      bottomNavigationBar: SpesoButtomNavBar(indexToShow: indexToShow),
    );
  }
}
