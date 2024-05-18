import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class IfElsePage extends StatefulWidget {
  static const name = 'if-else-page';
  const IfElsePage({super.key});

  @override
  State<IfElsePage> createState() => _IfElsePageState();
}

class _IfElsePageState extends State<IfElsePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('If else'),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
      );
}