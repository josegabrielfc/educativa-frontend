import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class EstructuraPage extends StatefulWidget {
  static const name = 'estructura-page';
  const EstructuraPage({super.key});

  @override
  State<EstructuraPage> createState() => _EstructuraPageState();
}

class _EstructuraPageState extends State<EstructuraPage> {
 @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Estructura'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
      );
}