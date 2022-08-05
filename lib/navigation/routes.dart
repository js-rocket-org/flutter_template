import 'package:flutter/material.dart';

import '../pages/page_one/page_one.dart';
import '../pages/page_two/page_two.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageOne.route:
      return MaterialPageRoute(
        settings: const RouteSettings(name: PageOne.route),
        builder: (context) => const PageOne(),
      );
    case PageTwo.route:
      return MaterialPageRoute(
        settings: const RouteSettings(name: PageTwo.route),
        builder: (context) => const PageTwo(),
      );
  }

  return MaterialPageRoute(
    settings: const RouteSettings(name: '/unknown'),
    builder: (context) => const _RouteErrorPage(
      title: 'Oops, something went wrong!',
      description: 'Maybe you forgot to register the route in router.dart?',
    ),
  );
}

class _RouteErrorPage extends StatelessWidget {
  /// The major text to be displayed in the page.
  final String title;

  /// Further description for the possible exception.
  final String? description;

  const _RouteErrorPage({
    Key? key,
    required this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      );
}
