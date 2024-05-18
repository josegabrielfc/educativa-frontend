import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class OperadoresAsignacionPage extends StatefulWidget {
  static const name = 'operadores-asignacion-page';
  const OperadoresAsignacionPage({super.key});

  @override
  State<OperadoresAsignacionPage> createState() => _OperadoresAsignacionPageState();
}

class _OperadoresAsignacionPageState extends State<OperadoresAsignacionPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Operadores asignacion'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
      );
}