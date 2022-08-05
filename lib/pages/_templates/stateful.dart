// Example page using a stateful widget

import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  //- public variable declarations
  static const String route = '/page_XX';

  const StatefulPage({Key? key}) : super(key: key);

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  void _onPressedNextPage() {
    // Stateful widgets have access to context without passing through
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
            onPressed: _onPressedNextPage,
            child: const Text('Go to next Page'),
          )
        ],
      ),
    );
  }
}
