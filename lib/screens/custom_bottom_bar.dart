import 'package:flutter/material.dart';
import 'package:speso_code/util/color.dart';

import '../util/dimension.dart';

class SpesoButtomNavBar extends StatelessWidget {
  const SpesoButtomNavBar({
    super.key,
    required this.indexToShow,
  });

  final ValueNotifier<int> indexToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(83),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: getScreenHeight(5),
            blurRadius: getScreenHeight(8),
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: getScreenHeight(2),
            blurRadius: getScreenHeight(4),
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationWidget(
              isItActive: indexToShow.value == 0,
              activeIcon: Icons.home,
              inActiveIcon: Icons.home,
              onTap: () {
                indexToShow.value = 0;
              },
              name: 'Service',
            ),
            BottomNavigationWidget(
              isItActive: indexToShow.value == 1,
              activeIcon: Icons.scanner,
              inActiveIcon: Icons.scanner,
              onTap: () {
                indexToShow.value = 1;
              },
              name: 'Scan',
            ),
            BottomNavigationWidget(
              isItActive: indexToShow.value == 2,
              activeIcon: Icons.chat,
              inActiveIcon: Icons.chat,
              onTap: () {
                indexToShow.value = 2;
              },
              name: 'Chat',
            ),
            BottomNavigationWidget(
              isItActive: indexToShow.value == 3,
              activeIcon: Icons.person,
              inActiveIcon: Icons.person,
              onTap: () {
                indexToShow.value = 3;
              },
              name: 'Me',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
    required this.isItActive,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.onTap,
    required this.name,
  });

  final bool isItActive;
  final IconData activeIcon, inActiveIcon;
  final Function() onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getScreenHeight(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: getScreenHeight(20),
              width: getScreenWidth(20),
              child: Icon(
                isItActive == true ? activeIcon : inActiveIcon,
                color: isItActive == true ? kPRYCOLOUR : kLightGray,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: isItActive == true ? kPRYCOLOUR : kLightGray,
              ),
            ),
            // CircleAvatar(
            //   radius: getScreenHeight(5),
            //   backgroundColor: isItActive == true ? kPRYCOLOUR : kLightGray,
            // ),
          ],
        ),
      ),
    );
  }
}
