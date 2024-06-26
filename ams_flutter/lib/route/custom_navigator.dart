import 'package:ams_flutter/features/onboarding/presentation/pages/create_password.dart';
import 'package:ams_flutter/features/onboarding/presentation/pages/providedetailspage.dart';
import 'package:ams_flutter/features/onboarding/presentation/pages/signup.dart';
import 'package:ams_flutter/features/onboarding/presentation/pages/whoareyou.dart';

import 'app_pages.dart';
import 'package:flutter/material.dart';
import 'package:ams_flutter/features/onboarding/presentation/pages/splash.dart';
final kNavigatorKey = GlobalKey<NavigatorState>();
class CustomNavigator {


  static Route<dynamic> controller(RouteSettings settings) {
    //use settings.arguments to pass arguments in pages
    switch (settings.name) {
      case AppPages.appEntry:
        return MaterialPageRoute(
          builder: (context) =>SplashScreen(),
          settings: settings,
        );
      case AppPages.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
          settings: settings,
        );
      case AppPages.createNewPassword:
        return MaterialPageRoute(
          builder: (context) => const CreatePassword(),
          settings: settings,
        );
      case AppPages.createProfile:
        return MaterialPageRoute(
          builder: (context) => const DetailsPage(),
          settings: settings,
        );
      case AppPages.createProfile:
        return MaterialPageRoute(
          builder: (context) => const DetailsPage(),
          settings: settings,
        );
      case AppPages.whoAreYou:
        return MaterialPageRoute(
          builder: (context) =>WhoAreYou(),
          settings: settings,
        );
      default:    throw ('This route name does not exit');
    }
  }
static Future<T?> pushTo<T extends Object?>(
BuildContext context,
String strPageName, {
Object? arguments,
}) async {
return await Navigator.of(context, rootNavigator: true)
    .pushNamed(strPageName, arguments: arguments);
}
// Pop the top view
static void pop(BuildContext context, {Object? result}) {
Navigator.pop(context, result);
}
// Pops to a particular view
static Future<T?> popTo<T extends Object?>(
BuildContext context,
String strPageName, {
Object? arguments,
}) async {
return await Navigator.popAndPushNamed(
context,
strPageName,
arguments: arguments,
);
}
static void popUntilFirst(BuildContext context) {
Navigator.popUntil(context, (page) => page.isFirst);
}
static void popUntilRoute(BuildContext context, String route, {var result}) {
Navigator.popUntil(context, (page) {
if (page.settings.name == route && page.settings.arguments != null) {
(page.settings.arguments as Map<String, dynamic>)["result"] = result;
return true;
}
return false;
});
}
static Future<T?> pushReplace<T extends Object?>(
BuildContext context,
String strPageName, {
Object? arguments,
}) async {
return await Navigator.pushReplacementNamed(
context,
strPageName,
arguments: arguments,
);
}

static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
BuildContext context,
String strPageName, {
Object? arguments,
}) async {
return await Navigator.pushNamedAndRemoveUntil(
context,
strPageName,
(route) => false,
arguments: arguments,
);
}
}