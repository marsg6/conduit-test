import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        useLegacyColorScheme: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
            label: '즐겨찾기',
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    final currentIndex = navigationShell.currentIndex;
    if (currentIndex == index) {
      return;
    }
    navigationShell.goBranch(index);
  }
}
