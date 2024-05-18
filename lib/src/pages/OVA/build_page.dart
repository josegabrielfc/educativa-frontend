import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/ciclos_page.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/do_while_page.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/equivalencia_while.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/for_page.dart';
import 'package:educativa_frontend/src/pages/OVA/ciclos/while_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/condicionales_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/if_else_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/switch_page.dart';
import 'package:educativa_frontend/src/pages/OVA/condicionales/tipos_if_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/entrada_salida_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/estructura_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/fundamentos_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/operadores_asignacion_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/operadores_relacionales_page.dart';
import 'package:educativa_frontend/src/pages/OVA/fundamentos/variables_page.dart';
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
      case SidebarItem.resultados:
        return const ResultadosPage();
      case SidebarItem.fundamentos:
        return const FundamentosPage();
            case SidebarItem.estructura:
              return const EstructuraPage();
            case SidebarItem.variables:
              return const VariablesPage();
            case SidebarItem.entradaSalida:
              return const EntradaSalidaPage();
            case SidebarItem.operadoresAsignacion:
              return const OperadoresAsignacionPage();
            case SidebarItem.operadoresRelacionales:
              return const OperadoresRelacionalesPage();
      case SidebarItem.condicionales:
        return const CondicionalesPage();
            case SidebarItem.ifElse:
              return const IfElsePage();
            case SidebarItem.tiposIf:
              return const TiposIfPage();
            case SidebarItem.switchCase:
              return const SwitchPage();
      case SidebarItem.ciclos:
        return const CiclosPage();
            case SidebarItem.ciclosWhile:
              return const WhilePage();
            case SidebarItem.ciclosDoWhile:
              return const DoWhilePage();
            case SidebarItem.ciclosFor:
              return const ForPage();
            case SidebarItem.equivalenciaWhile:
              return const EquivalenciaWhilePage();
    }
  }
}
