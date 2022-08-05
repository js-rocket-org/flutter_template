// Example page using a stateless widget

import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  //- public variable declarations
  static const String route = '/page_XX';

  const StatelessPage({Key? key}) : super(key: key);

  void _onPressedNextPage(BuildContext context) {
    Navigator.pushNamed(context, '/nextRoute');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          const Text('This is page XX'),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => _onPressedNextPage(context),
            child: const Text('Go to next Page'),
          )
        ],
      ),
    );
  }
}
