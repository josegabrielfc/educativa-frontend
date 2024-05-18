import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class CiclosPage extends StatefulWidget {
  static const name = 'ciclos-page';
  const CiclosPage({super.key});

  @override
  State<CiclosPage> createState() => _CiclosPageState();
}

class _CiclosPageState extends State<CiclosPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Ciclos'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
      );
}