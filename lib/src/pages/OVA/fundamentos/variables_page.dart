import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class VariablesPage extends StatefulWidget {
  static const name = 'variables-page';
  const VariablesPage({super.key});

  @override
  State<VariablesPage> createState() => _VariablesPageState();
}

class _VariablesPageState extends State<VariablesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Variables'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
      );
}