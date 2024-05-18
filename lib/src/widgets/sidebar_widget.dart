import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';

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
                  const SizedBox(height: 24),
                  buildMenuItem(
                    context,
                    item: SidebarItem.resultados,
                    text: 'Ver resultados',
                    icon: Icons.remove_red_eye_outlined,
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    context,
                    item: SidebarItem.fundamentos,
                    text: '1. Fundamentos del Lenguaje de Programación',
                    icon: Icons.code,
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    context,
                    item: SidebarItem.condicionales,
                    text: '2. Bloques Condicionales',
                    icon: Icons.wysiwyg,
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    context,
                    item: SidebarItem.ciclos,
                    text: '3. Bloques Iterativos',
                    icon: Icons.loop,
                  ),
                ],
              ),
            ),
            separadorVertical(context, 17),
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

  void selectItem(BuildContext context, SidebarItem item) {
    final provider = Provider.of<SidebarProvider>(context, listen: false);
    provider.setSidebarItem(item);
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.black12,
        child: InkWell(
          onTap: () {

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
                      "Cerrar sesion",
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
          height: MediaQuery.of(context).size.height * 0.14,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.scaleDown),
            ),
          ),
        ),
      );
}
