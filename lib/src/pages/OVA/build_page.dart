
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/pages/OVA/resultados_page.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildPage extends StatefulWidget {
  const BuildPage({super.key});

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  @override
  Widget build(BuildContext context) => buildPages();

   Widget buildPages() {
    final provider = Provider.of<SidebarProvider>(context);
    final navigationItem = provider.sidebarItem;

    switch (navigationItem) {
      case SidebarItem.header:
        return const ResultadosPage();
      case SidebarItem.registrarUsuario:
        return const ResultadosPage();
      case SidebarItem.estudiantes:
        return const ResultadosPage();
      case SidebarItem.workflow:
        return const ResultadosPage();
      case SidebarItem.editarEstudiante:
        return const ResultadosPage();
      case SidebarItem.plugins:
        return const ResultadosPage();
      case SidebarItem.notifications:
        return const ResultadosPage();
    }
  }
}