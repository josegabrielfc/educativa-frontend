/*
Son las páginas del home.
*/
import 'package:educativa_frontend/src/pages/Login/login_page.dart';
import 'package:educativa_frontend/src/pages/OVA/app_ova.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/ciclos_page.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/do_while_page.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/equivalencia_while.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/for_page.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/while_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/condicionales_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/if_else_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/switch_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/tipos_if_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/entrada_salida_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/estructura_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/fundamentos_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/operadores_asignacion_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/operadores_relacionales_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/variables_page.dart';
import 'package:educativa_frontend/src/pages/OVA/resultados_page.dart';
import 'package:educativa_frontend/src/pages/admin/estudiantes_page.dart';
import 'package:educativa_frontend/src/pages/admin/resultados_estudiantes_page.dart';
import 'package:educativa_frontend/src/pages/home_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget> pages = {
  //Login
  LoginPage.name: const LoginPage(),
  
  //Home
  HomePage.name: const HomePage(),

  //App
  AppOvaPage.name: const AppOvaPage(),

  //Resultados
  ResultadosPage.name: const ResultadosPage(),

  //Fundamentos
  FundamentosPage.name: const FundamentosPage(),
    EstructuraPage.name: const EstructuraPage(),
    VariablesPage.name: const VariablesPage(),
    EntradaSalidaPage.name: const EntradaSalidaPage(),
    OperadoresAsignacionPage.name: const OperadoresAsignacionPage(),
    OperadoresRelacionalesPage.name: const OperadoresRelacionalesPage(),
  
  //Condicionales
  CondicionalesPage.name: const CondicionalesPage(),
    IfElsePage.name: const IfElsePage(),
    TiposIfPage.name: const TiposIfPage(),
    SwitchPage.name: const SwitchPage(),

  //Ciclos
  CiclosPage.name: const CiclosPage(),
    WhilePage.name: const WhilePage(),
    DoWhilePage.name: const DoWhilePage(),
    ForPage.name: const ForPage(),
    EquivalenciaWhilePage.name: const EquivalenciaWhilePage(),


  // Admin
  EstudiantesPage.name: const EstudiantesPage(),
  ResultadosEstudiantePage.name: const ResultadosEstudiantePage(),
};
