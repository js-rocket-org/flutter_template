import 'package:flutter/material.dart';

import '../tab_one/tab_one.dart';
import '../tab_two/tab_two.dart';

final List _tabScreens = [
  {"screen": const TabOne(), "title": "Tab A Title"},
  {"screen": const TabTwo(), "title": "Tab B Title"}
];

const _bottomTabs = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab A'),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Tab B")
];

class PageThree extends StatefulWidget {
  static const String route = '/PageThree';

  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> with RouteAware {
  int _selectedScreenIndex = 0;

  void _onTapBottomNav(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  // void _onPressedNextPage() {
  //   // Stateful widgets have access to context without passing through
  //   Navigator.pushNamed(context, PageOne.route);
  // }

  @override
  Widget build(BuildContext context) {
    final selectedScreen = _tabScreens[_selectedScreenIndex];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(selectedScreen['title'])),
        // automaticallyImplyLeading: false,
      ),
      body: selectedScreen["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _onTapBottomNav,
        items: _bottomTabs,
      ),
    );
  }
}
