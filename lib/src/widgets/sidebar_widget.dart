import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:educativa_frontend/src/providers/usuario_provider.dart';

class SidebarWidget extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(horizontal: 20);

  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(142, 142, 142, 1),
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildHeader(context),
                  const SizedBox(height: 17),
                  buildMenuItem(
                    context,
                    item: SidebarItem.resultados,
                    text: 'Ver resultados',
                    icon: Icons.remove_red_eye_outlined,
                  ),
                  const SizedBox(height: 17),
                  buildExpansionMenuItem(
                    context,
                    item: SidebarItem.fundamentos,
                    text: '1. Fundamentos del Lenguaje de Programación',
                    icon: Icons.code,
                    subItems: [
                      SidebarSubItem(SidebarItem.estructura, '1.1. Estructura General del Lenguaje'),
                      SidebarSubItem(SidebarItem.variables, '1.2. Variables – Identificador y Tipo de Dato'),
                      SidebarSubItem(SidebarItem.entradaSalida, '1.3. Instrucciones de entrada/salida por consola estándar (Teclado y Pantalla)'),
                      SidebarSubItem(SidebarItem.operadoresAsignacion, '1.4. Operadores de Asignación y Aritméticos'),
                      SidebarSubItem(SidebarItem.operadoresRelacionales, '1.5. Operadores Relacionales y Lógicos'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildExpansionMenuItem(
                    context,
                    item: SidebarItem.condicionales,
                    text: '2. Bloques Condicionales',
                    icon: Icons.wysiwyg,
                    subItems: [
                      SidebarSubItem(SidebarItem.ifElse, '2.1. Bloque condicional if/else'),
                      SidebarSubItem(SidebarItem.tiposIf, '2.1.1. Tipos de If'),
                      SidebarSubItem(SidebarItem.switchCase, '2.2. Sentencia de selección múltiple switch'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildExpansionMenuItem(
                    context,
                    item: SidebarItem.ciclos,
                    text: '3. Bloques Iterativos',
                    icon: Icons.loop,
                    subItems: [
                      SidebarSubItem(SidebarItem.ciclosWhile, '3.1. Ciclos while'),
                      SidebarSubItem(SidebarItem.ciclosDoWhile, '3.2. Ciclos do-while'),
                      SidebarSubItem(SidebarItem.ciclosFor, '3.3. Ciclos for'),
                      SidebarSubItem(SidebarItem.equivalenciaWhile, '3.3.1. Equivalencia con ciclo while'),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                size: 40,
                color: blancoColor,
              ),
              title: texto("Cerrar sesión", fontBold, bigSize + 4,
                blancoColor, TextAlign.center),
              onTap: () {
                final usuarioProvider =
                  Provider.of<UsuarioProvider>(context, listen: false);
                usuarioProvider.vaciarUsuarioProvider();
                Navigator.pushReplacementNamed(context, 'login-page');
              },
            ),
            separadorVertical(context, 5),
            buildLogo(context, image: 'images/fundamentos.jpg'),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required SidebarItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<SidebarProvider>(context);
    final currentItem = provider.sidebarItem;
    final isSelected = item == currentItem;

    final color = blancoColor;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: azulClaColor,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  Widget buildExpansionMenuItem(
    BuildContext context, {
    required SidebarItem item,
    required String text,
    required IconData icon,
    required List<SidebarSubItem> subItems,
  }) {
    final provider = Provider.of<SidebarProvider>(context);
    final currentItem = provider.sidebarItem;
    final isSelected = item == currentItem || subItems.any((subItem) => subItem.item == currentItem);

    final color = isSelected ? azulClaColor : blancoColor;

    return ExpansionTile(
      title: ListTile(
        selected: isSelected,
        selectedTileColor: azulClaColor,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
      initiallyExpanded: isSelected,
      children: subItems.map((subItem) {
        final isSubItemSelected = subItem.item == currentItem;
        final subItemColor = isSubItemSelected ? azulClaColor : blancoColor;
        return ListTile(
          selected: isSubItemSelected,
          selectedTileColor: azulClaColor,
          title: Text(subItem.text, style: TextStyle(color: subItemColor, fontSize: 14)),
          onTap: () => selectItem(context, subItem.item),
        );
      }).toList(),
    );
  }

  void selectItem(BuildContext context, SidebarItem item) {
    final provider = Provider.of<SidebarProvider>(context, listen: false);
    provider.setSidebarItem(item);
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.black12,
        child: InkWell(
          onTap: (){
            
          },
          child: Container(
            padding: padding.add(const EdgeInsets.symmetric(vertical: 10)),
            child: Row(
              children: [
                const Icon(Icons.logout_rounded),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cerrar sesión",
                      style: TextStyle(fontSize: 20, color: blancoColor),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildLogo(
    BuildContext context, {
    required String image,
  }) =>
      Material(
        color: const Color.fromRGBO(142, 142, 142, 1),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
            ),
          ),
        ),
      );
}

class SidebarSubItem {
  final SidebarItem item;
  final String text;

  SidebarSubItem(this.item, this.text);
}
