import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperadoresRelacionalesPage extends StatefulWidget {
  static const name = 'operadores-relacionales-page';
  const OperadoresRelacionalesPage({super.key});

  @override
  State<OperadoresRelacionalesPage> createState() =>
      _OperadoresRelacionalesPageState();
}

class _OperadoresRelacionalesPageState
    extends State<OperadoresRelacionalesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(backgroundColor: const Color(0xFFC2F8FA)),
        floatingActionButton: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 80, top: 20),
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
                provider.setSidebarItem(SidebarItem.condicionales);
              }),
        ),
        body: Stack(children: [
          Scaffold(
              backgroundColor: Colors.transparent.withOpacity(0.11),
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
                    texto("Operadores Relacionales y Lógicos", fontExtraBold,
                        bigSize + 8, azulOscColor, TextAlign.center),
                    SizedBox(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          texto(
                              "Los operadores relacionales se utilizan para comparar valores, mientras que los operadores lógicos se utilizan para combinar múltiples condiciones booleanas.",
                              fontApp,
                              bigSize,
                              negroColor,
                              TextAlign.center),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                          texto("Operadores Relacionales", fontApp, bigSize,
                              azulOscColor, TextAlign.center),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("== : Igual a.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/igual.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("!= : Diferente de.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/diferente.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("> : Mayor que.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/mayor.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("< : Menor que.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/menor.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto(">= : Mayor o igual que.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/mayor-igual.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("<= : Menor o igual que.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/menor-igual.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                          texto("Operadores Lógicos", fontApp, bigSize,
                              azulOscColor, TextAlign.center),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("and : Y lógico.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/and.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("or : O lógico.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/or.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("not : Negación lógica.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/not.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 2),
                          Divider(
                            color: azulClaColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2),
                        ],
                      ),
                    )
                  ]))))
        ]));
  }
}