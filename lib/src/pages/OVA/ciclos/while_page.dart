import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class WhilePage extends StatefulWidget {
  static const name = 'while-page';
  const WhilePage({super.key});

  @override
  State<WhilePage> createState() => _WhilePageState();
}

class _WhilePageState extends State<WhilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Ciclos while'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
      );
}