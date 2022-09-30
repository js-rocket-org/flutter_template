import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../page_one/page_one.dart';
import '../page_three/page_three.dart';

class PageTwo extends StatefulWidget {
  static const String route = '/PageTwo';

  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> with RouteAware {
  void _onPageEnter() {
    print('_onPageEnter PageTwo');
  }

  void _onPageExit() {
    print('_onPageExit PageTwo');
  }

  void _onPressedPageOne() {
    Navigator.pushNamed(context, PageOne.route);
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
            const Text('This is page 2', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _onPressedPageOne,
              child: const Text('Go to Page 1'),
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
