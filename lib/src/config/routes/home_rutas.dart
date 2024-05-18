/*
Son las páginas del home.
*/
import 'package:educativa_frontend/src/pages/OVA/app_ova.dart';
import 'package:educativa_frontend/src/pages/home_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget> pages = {
  //Home
  HomePage.name: const HomePage(),

  //App
  AppOvaPage.name: const AppOvaPage(),
};
