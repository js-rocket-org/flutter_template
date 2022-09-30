//- Example page using a stateful widget
//- Pages should always be stateful if you need to execute a function when you enter or exit the page

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_lang.dart';

import 'package:flutter_template/components/page_layout_no_header.dart';
import 'package:flutter_template/pages/page_three/page_three.dart';
import 'package:flutter_template/states/app_config_provider.dart';
import 'package:provider/provider.dart';

//- declare any constants/variables belonging to ths page here

List<PopupMenuEntry<String>> dropDown1Items = [
  const PopupMenuItem(value: 'en', child: Text('English')),
  const PopupMenuItem(value: 'es', child: Text('Española')),
  const PopupMenuItem(value: 'he', child: Text('עִברִית')),
];

//- declare functions related to this page here where possible, be sure to prefix with _ when not used outside this file
//- You will need to pass context because it is outside the state

class Onboarding1Page extends StatefulWidget {
  static const String route = '/Onboarding1Page';

  const Onboarding1Page({Key? key}) : super(key: key);

  @override
  State<Onboarding1Page> createState() => _Onboarding1PageState();
}

class _Onboarding1PageState extends State<Onboarding1Page> with RouteAware {
  //- declare your variables here
  String _selectedMenu = '';
  late AppConfigProvider appConfig;

  //- declare functions outside class whenever possible or here

  void _onPressedPageThree() {
    Navigator.pushNamed(context, PageThree.route);
  }

  void _onLanguageChange(String newLanguageCode) {
    print('New language $newLanguageCode');

    setState(() => _selectedMenu = newLanguageCode);

    var newState = appConfig.state;
    newState.defaultLanguage = newLanguageCode;
    appConfig.setState(newState);
  }

  //- declare your overrides here

  @override
  Widget build(BuildContext context) {
    appConfig = context.watch<AppConfigProvider>();
    final localeText = AppLocalizations.of(context)!;

    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    String currentCountry = myLocale.countryCode ?? '';

    Widget getDropDown() => PopupMenuButton<String>(
          initialValue: currentLanguage,
          onSelected: (value) => _onLanguageChange(value),
          itemBuilder: (_) => dropDown1Items,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Text(
                '${localeText.current_language}: $currentLanguage $currentCountry'),
          ),
        );

    return PageLayoutNoHeader(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            Text(
              localeText.hello_world,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20.0),
            getDropDown(),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                localeText.this_is_a_demo__,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _onPressedPageThree,
              child: const Text('Next page'),
            )
          ],
        ),
      ),
    );
  }
}
