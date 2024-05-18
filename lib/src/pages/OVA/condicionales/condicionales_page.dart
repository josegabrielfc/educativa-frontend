import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class CondicionalesPage extends StatefulWidget {
  static const name = 'condicionales-page';
  const CondicionalesPage({super.key});

  @override
  State<CondicionalesPage> createState() => _CondicionalesPageState();
}

class _CondicionalesPageState extends State<CondicionalesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Condicionales'),
          centerTitle: true,
          backgroundColor: Colors.lime,
        ),
      );
}