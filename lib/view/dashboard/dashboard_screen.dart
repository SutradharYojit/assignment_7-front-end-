import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../view.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final ValueNotifier<int> _screenIndex = ValueNotifier(0);

  final List<Widget> _screens = [
    const HomeScreen(),
    const AddBlogScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _screenIndex,
        builder: (context, value, child) {
          return _screens[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _screenIndex,
        builder: (context, value, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                label: StringManager.blogScreen,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: StringManager.addBlogScreen,
              ),
            ],
            currentIndex: value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            iconSize: 35,
            elevation: 10,
            onTap: (value) {
              _screenIndex.value = value;
            },
          );
        },
      ),
    );
  }
}
