import 'package:educativa_frontend/src/pages/OVA/build_page.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppOvaPage extends StatelessWidget {
  static const name = 'ova-page';
  static const String title = 'OVA';

  const AppOvaPage({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => SidebarProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: const BuildPage(),
        ),
      );
}