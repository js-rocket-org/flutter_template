import 'package:flutter/material.dart';

import '../page_two/page_two.dart';

class TabTwo extends StatelessWidget {
  //- public variable declarations
  static const String route = '/TabTwo';

  const TabTwo({Key? key}) : super(key: key);

  void _onPressedNextPage(BuildContext context) {
    Navigator.pushNamed(context, PageTwo.route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 50.0),
          const Text('This is tab 2', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: const Text('Go to Page Two'),
            onPressed: () => _onPressedNextPage(context),
          )
        ],
      ),
    );
  }
}
