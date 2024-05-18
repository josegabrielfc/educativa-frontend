import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class EquivalenciaWhilePage extends StatefulWidget {
  static const name = 'equivalencia-while-page';
  const EquivalenciaWhilePage({super.key});

  @override
  State<EquivalenciaWhilePage> createState() => _EquivalenciaWhilePageState();
}

class _EquivalenciaWhilePageState extends State<EquivalenciaWhilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Equivalencia while'),
          centerTitle: true,
          backgroundColor: Colors.lightGreenAccent,
        ),
      );
}