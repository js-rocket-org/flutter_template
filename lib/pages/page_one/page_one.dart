import 'package:flutter/material.dart';

import '../page_two/page_two.dart';

class PageOne extends StatelessWidget {
  //- public variable declarations
  static const String route = '/PageOne';

  const PageOne({Key? key}) : super(key: key);

  void _onPressedNextPage(BuildContext context) {
    Navigator.pushNamed(context, PageTwo.route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 50.0),
          const Text('This is page 1', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: const Text('Go to next Page'),
            onPressed: () => _onPressedNextPage(context),
          )
        ],
      ),
    );
  }
}
