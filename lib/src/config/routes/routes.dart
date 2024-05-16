import 'package:flutter_deep_linking/flutter_deep_linking.dart';
import 'package:educativa_frontend/src/pages/pages.dart' ;

final router = Router(routes: [
  Route(routes: [
    Route(
      matcher: Matcher.path(LoginPage.name),
      materialBuilder: (_, __) => const LoginPage(),
    ),
    Route(
      matcher: Matcher.path(SignupPage.name),
      materialBuilder: (_, __) => const SignupPage(),
    ),
  ])
]);
