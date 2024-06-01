import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FundamentosPage extends StatefulWidget {
  static const name = 'fundamentos-page';
  const FundamentosPage({super.key});

  @override
  State<FundamentosPage> createState() => _FundamentosPageState();
}

class _FundamentosPageState extends State<FundamentosPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(backgroundColor: const Color(0xFFC2F8FA)),
        floatingActionButton: Container(
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(left: 80, top: 20),
          child: CustomButton(
              color: azulOscColor,
              hoverColor: azulClaColor,
              size: bigSize + 4,
              textButton: 'Siguiente',
              heightButton: 45,
              widthButton:
                  selectDevice(web: 0.22, cel: 0.64, sizeContext: size.width),
              sizeBorderRadius: 15,
              duration: 1000,
              onTap: () async {
                final provider =
                    Provider.of<SidebarProvider>(context, listen: false);
                provider.setSidebarItem(SidebarItem.estructura);
              }),
        ),
        body: Stack(children: [
          Scaffold(
              backgroundColor: Colors.transparent.withOpacity(0.1),
              body: SizedBox(
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset(
                      'images/background.png',
                      width: size.width,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    separadorVertical(context, 2),
                    texto("¿Qué es un lenguaje de programación?", fontExtraBold,
                        bigSize + 8, azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.4,
                      child: texto(
                          "Un lenguaje de programación es un conjunto de reglas gramaticales (tanto sintácticas como semánticas) que instruyen a que un ordenador o dispositivo se comporte de una cierta manera. Cada lenguaje de programación tiene un vocabulario, un conjunto único de palabras clave que sigue a una sintaxis especial para formar y organizar instrucciones del ordenador.",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 2),
                    texto("Tipos de lenguaje de programación", fontApp,
                        bigSize + 2, azulOscColor, TextAlign.start),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.4,
                            child: Column(
                              children: [
                                texto("Lenguajes de bajo nivel", fontBold,
                                    bigSize, negroColor, TextAlign.start),
                                texto(
                                    "Están diseñados para un hardware específico y que por lo tanto no pueden migrar o exportarse a otros computadores. Sacan el mayor provecho posible al sistema para el que fueron diseñados, pero no aplican para ningún otro.",
                                    fontBold,
                                    bigSize,
                                    negroColor,
                                    TextAlign.start)
                              ],
                            ),
                          ),
                          separadorHorizontal(context, 2),
                          SizedBox(
                            width: size.width * 0.4,
                            child: Column(
                              children: [
                                texto("Lenguajes de alto nivel", fontBold,
                                    bigSize, negroColor, TextAlign.start),
                                texto(
                                    "Aspiran a ser un lenguaje más universal, por lo que pueden emplearse indistintamente de la arquitectura del hardware, es decir, en diversos tipos de sistemas. Los hay de propósito general y de propósito específico.",
                                    fontBold,
                                    bigSize,
                                    negroColor,
                                    TextAlign.start)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    separadorVertical(context, 2),
                    Image.asset("images/fundamentos/lenguajes.png"),
                    separadorVertical(context, 2),
                  ]),
                ),
              ))
        ]));
  }
}
