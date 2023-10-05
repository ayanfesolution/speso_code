import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speso_code/screens/custom_bottom_bar.dart';

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
    return Scaffold(
      bottomNavigationBar: SpesoButtomNavBar(indexToShow: indexToShow),
    );
  }
}
