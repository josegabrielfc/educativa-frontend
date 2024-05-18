
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
      case SidebarItem.logout:
        return const ResultadosPage();
        case SidebarItem.resultados:
        return const ResultadosPage();
      case SidebarItem.fundamentos:
        return const ResultadosPage();
      case SidebarItem.condicionales:
        return const ResultadosPage();
      case SidebarItem.ciclos:
        return const ResultadosPage();
    }
  }
}