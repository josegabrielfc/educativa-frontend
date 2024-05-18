import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class ResultadosPage extends StatefulWidget {
  const ResultadosPage({super.key});

  @override
  State<ResultadosPage> createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Notifications'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
      );
}
