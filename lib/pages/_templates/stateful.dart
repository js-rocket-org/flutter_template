//- Example page using a stateful widget
//- Pages should always be stateful if you need to execute a function when you enter or exit the page

import 'package:flutter/material.dart';

import '../../navigation/routes.dart';

//- declare any constants/variables belonging to ths page here

//- declare functions related to this page here where possible, be sure to prefix with _ when not used outside this file
//- You will need to pass context because it is outside the state

class StatefulPage extends StatefulWidget {
  static const String route = '/StatefulPage';

  const StatefulPage({Key? key}) : super(key: key);

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> with RouteAware {
  //- declare your variables here

  //- declare functions outside class whenever possible or here

  //- declare your events here, keep functions short if possible and call other functions instead
  //- the _onPageEnter function should be called each time the page becomes visible
  void _onPageEnter() {
    print('${DateTime.now()} _onPageEnter StatefulPage');
  }

  //- the _onPageExit function should be called each time the page is no longer visible
  void _onPageExit() {
    print('${DateTime.now()} _onPageExit StatefulPage');
  }

  void _onPressedPageTwo() {
    Navigator.pushNamed(context, '/page2');
  }

  void _onPressedPageThree() {
    Navigator.pushNamed(context, '/page3');
  }

  //- declare your overrides here
  //- The next six overrides are required just to support _onPageEnter and _onPageExit functions
  //- Note didPopNext, didPop only triggers when page is wrapped in a Scaffold() widget (might be a bug i Flutter)
  @override
  void didPush() {
    _onPageEnter();
    super.didPush();
  }

  @override
  void didPushNext() {
    _onPageExit();
    super.didPushNext();
  }

  @override
  void didPopNext() {
    _onPageEnter();
    super.didPopNext();
  }

  @override
  void didPop() {
    _onPageExit();
    super.didPop();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainRouteObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    mainRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
              onPressed: _onPressedPageTwo,
              child: const Text('Go to Page 2'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _onPressedPageThree,
              child: const Text('Go to Page 3'),
            )
          ],
        ),
      ),
    );
  }
}
