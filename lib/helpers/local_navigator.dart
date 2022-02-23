import 'package:flutter/cupertino.dart';
import 'package:web_dashboard/constants/controllers.dart';
import 'package:web_dashboard/routing/router.dart';
import 'package:web_dashboard/routing/routes.dart';

Navigator localNavigator() {
  return Navigator(
    key: navigationController.navigationKey,
    initialRoute: overviewPageRoute,
    onGenerateRoute: generateRoute,
  );
}
