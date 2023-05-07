import 'package:flutter/material.dart';
import 'package:oxygen_detector/home/home_screen.dart';
import 'package:oxygen_detector/screens/health.dart';
import 'package:oxygen_detector/screens/my_page.dart';

class BottomNavbar extends StatefulWidget {
  final int initialIndex;
  const BottomNavbar({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Health(),
    const MyPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      selectedIconTheme: const IconThemeData(color: Colors.white),
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        // Navigate to the selected screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => _screens[index]),
        );
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              color: _selectedIndex == 0
                  ? Colors.white
                  : Colors.white.withOpacity(0.5)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box,
              color: _selectedIndex == 1
                  ? Colors.white
                  : Colors.white.withOpacity(0.5)),
          label: 'Health',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
              color: _selectedIndex == 2
                  ? Colors.white
                  : Colors.white.withOpacity(0.5)),
          label: 'User',
        ),
      ],
    );
  }
}
