import 'package:flutter/material.dart';
import 'package:flutter_template/constants.dart';

import 'package:flutter_template/main.dart';
import 'package:flutter_template/models/app_config.dart';

// just a global variable related to app configuration
String apiBaseURL =
    APP_FLAVOR == AppFlavors.prod ? API_BASE_URL_PROD : API_BASE_URL_STAGING;

class AppConfigProvider extends ChangeNotifier {
  AppConfig state = AppConfig();

  void setBaseUrl(String newUrl) {
    apiBaseURL = newUrl;

    // There should be no UI changes when base api url is changed, so no need for
    // notifyListeners();
  }

  // if saving to local storage, this will restore into this provider state
  // void getState() async {
  //   final appconfigString = await kvGet(KvKey.APP_CONFIG);
  //   if (appconfigString == null) return;
  //   state = AppConfig.fromJsonString(appconfigString);
  // }

  void setState(AppConfig newAppConfig) {
    state = newAppConfig;
    // Maybe save it to storage if you want.
    notifyListeners();
  }
}
