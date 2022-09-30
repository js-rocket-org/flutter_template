//- Example page using a stateless widget, use Stateful widget whenever possible for pages
//- because support for _onPageEnter and _onPageExit functions is currently not possible to achieve

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_template/routes/routes.dart';

class PageLayoutNoHeader extends StatefulWidget {
  final Widget? top;
  final Widget body;
  final Widget? bottom;
  final Color? backgroundColor;
  final Brightness? brightness;
  final Function()? onEnterScreen;
  final Function()? onExitScreen;
  final Function()? onPageRunOnce;

  const PageLayoutNoHeader({
    Key? key,
    required this.body,
    this.top,
    this.bottom,
    this.backgroundColor,
    this.brightness,
    this.onEnterScreen,
    this.onExitScreen,
    this.onPageRunOnce,
  }) : super(key: key);

  @override
  State<PageLayoutNoHeader> createState() => _PageLayoutNoHeaderState();
}

class _PageLayoutNoHeaderState extends State<PageLayoutNoHeader>
    with RouteAware {
  void _onPageEnter() {
    if (widget.onEnterScreen != null) {
      Future.delayed(Duration.zero, () => widget.onEnterScreen!());
    }
  }

  void _onPageExit() {
    if (widget.onExitScreen != null) {
      Future.delayed(Duration.zero, () => widget.onExitScreen!());
    }
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

  Widget _renderTopWidget() => widget.top ?? const SizedBox.shrink();

  Widget _renderBottomWidget() => widget.bottom ?? const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness:
            widget.brightness ?? Brightness.light,
        statusBarIconBrightness: widget.brightness ?? Brightness.light,
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: widget.backgroundColor ?? Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _renderTopWidget(),
            widget.body,
          ],
        ),
        bottomNavigationBar: _renderBottomWidget(),
      ),
    );
  }
}
