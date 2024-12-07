import 'package:flutter/material.dart';
import 'package:mobile_programming/layout/home/grid_view_learning.dart';
import 'package:mobile_programming/layout/home/list_view_learning.dart';
import 'package:mobile_programming/layout/home/my_home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const MyHomePage(title: 'My Home Page'),
    const GridViewLearning(),
    const ListViewLearning(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: 'GridView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListView',
          ),
        ],
      ),
    );
  }
}
