import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class OperadoresRelacionalesPage extends StatefulWidget {
  static const name = 'operadores-relacionales-page';
  const OperadoresRelacionalesPage({super.key});

  @override
  State<OperadoresRelacionalesPage> createState() => _OperadoresRelacionalesPageState();
}

class _OperadoresRelacionalesPageState extends State<OperadoresRelacionalesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Operadores relacionales'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
      );
}