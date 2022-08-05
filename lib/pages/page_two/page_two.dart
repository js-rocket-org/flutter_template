import 'package:flutter/material.dart';

import '../page_one/page_one.dart';

class PageTwo extends StatefulWidget {
  static const String route = '/PageTwo';

  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  void _onPressedNextPage() {
    // Stateful widgets have access to context without passing through
    Navigator.pushNamed(context, PageOne.route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 50.0),
          const Text('This is page 2', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _onPressedNextPage,
            child: const Text('Go to next Page'),
          )
        ],
      ),
    );
  }
}
