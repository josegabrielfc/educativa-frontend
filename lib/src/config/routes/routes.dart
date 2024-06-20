import 'package:educativa_frontend/src/pages/OVA/app_ova.dart';
import 'package:educativa_frontend/src/pages/admin/estudiantes_page.dart';
import 'package:educativa_frontend/src/pages/admin/resultados_estudiantes_page.dart';
import 'package:flutter_deep_linking/flutter_deep_linking.dart';
import 'package:educativa_frontend/src/pages/pages.dart';

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
    Route(
      matcher: Matcher.path(HomePage.name),
      materialBuilder: (_, __) => const HomePage(),
    ),
    Route(
      matcher: Matcher.path(AppOvaPage.name),
      materialBuilder: (_, __) => const AppOvaPage(),
    ),
    Route(
      matcher: Matcher.path(EstudiantesPage.name),
      materialBuilder: (_, __) => const EstudiantesPage(),
    ),
    Route(
      matcher: Matcher.path(ResultadosEstudiantePage.name),
      materialBuilder: (_, __) => const ResultadosEstudiantePage(),
    ),
  ])
]);
