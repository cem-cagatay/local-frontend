import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    Center(child: Text('Search Page')), // Placeholder
    Center(child: Text('Favorites Page')), // Placeholder
    Center(child: Text('Notifications Page')), // Placeholder
    const ProfileScreen(),
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
        selectedItemColor: Colors.brown[900],
        unselectedItemColor: Colors.brown[200],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: CircleAvatar(radius: 12), label: ''),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFCFAF3),
        elevation: 8,
      ),
    );
  }
} 