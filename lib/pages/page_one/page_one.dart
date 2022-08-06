import 'package:flutter/material.dart';

import '../../navigation/routes.dart';
import '../page_two/page_two.dart';
import '../page_three/page_three.dart';

class PageOne extends StatefulWidget {
  static const String route = '/PageOne';

  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with RouteAware {
  void _onPageEnter() {
    print('_onPageEnter PageOne');
  }

  void _onPageExit() {
    print('_onPageExit PageOne');
  }

  void _onPressedPageTwo() {
    Navigator.pushNamed(context, PageTwo.route);
  }

  void _onPressedPageThree() {
    Navigator.pushNamed(context, PageThree.route);
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    print('${DateTime.now()} called: didPush');
    _onPageEnter();
    super.didPush();
  }

  @override
  void didPushNext() {
    // Covering route was popped off the navigator.
    print('${DateTime.now()} called: didPushNext');
    _onPageExit();
    super.didPushNext();
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    print('${DateTime.now()} called: didPopNext');
    _onPageEnter();
    super.didPopNext();
  }

  @override
  void didPop() {
    // Covering route was popped off the navigator.
    print('${DateTime.now()} called: didPop');
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
