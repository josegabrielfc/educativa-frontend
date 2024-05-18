import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class TiposIfPage extends StatefulWidget {
  static const name = 'tipos-if-page';
  const TiposIfPage({super.key});

  @override
  State<TiposIfPage> createState() => _TiposIfPageState();
}

class _TiposIfPageState extends State<TiposIfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Tipos de if'),
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
        ),
      );
}