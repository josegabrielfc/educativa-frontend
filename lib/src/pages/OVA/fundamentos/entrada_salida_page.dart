import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class EntradaSalidaPage extends StatefulWidget {
  static const name = 'entradaSalida-page';
  const EntradaSalidaPage({super.key});

  @override
  State<EntradaSalidaPage> createState() => _EntradaSalidaPageState();
}

class _EntradaSalidaPageState extends State<EntradaSalidaPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Entrada salida'),
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
      );
}