import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperadoresAsignacionPage extends StatefulWidget {
  static const name = 'operadores-asignacion-page';
  const OperadoresAsignacionPage({super.key});

  @override
  State<OperadoresAsignacionPage> createState() =>
      _OperadoresAsignacionPageState();
}

class _OperadoresAsignacionPageState extends State<OperadoresAsignacionPage> {
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
                provider.setSidebarItem(SidebarItem.operadoresRelacionales);
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
                    texto(
                        "Operadores de Asignación y  Aritméticos",
                        fontExtraBold,
                        bigSize + 8,
                        azulOscColor,
                        TextAlign.center),
                    SizedBox(
                        width: size.width * 0.9,
                        child: Column(children: [
                          texto(
                              "Los operadores de asignación se utilizan para asignar valores a las variables, mientras que los operadores aritméticos se utilizan para realizar operaciones matemáticas.",
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
                          texto("Operadores de Asignación", fontApp, bigSize,
                              azulOscColor, TextAlign.center),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto(
                                        "= : Asigna un valor a una variable (Se debe considerar el tipo de dato).",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/asignar-variable.png",
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
                                    texto(
                                        "+= : Suma el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/incrementar-variable.png",
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
                                    texto(
                                        "-= : Resta el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/decrementar-variable.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto(
                                        "*= : Multiplica el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/incre-multi-variable.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto(
                                        "/= : Divide el valor de la derecha al valor de la variable y asigna el resultado a la variable.",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/decre-divi-variable.png",
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
                          texto("Operadores de Aritméticos", fontApp, bigSize,
                              azulOscColor, TextAlign.center),
                          separadorVertical(context, 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("+ : Suma.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/suma.png",
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
                                    texto("- : Resta.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/resta.png",
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
                                    texto("* : Multiplicación.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/multiplicacion.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          separadorVertical(context, 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto("/ : División.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/division.png",
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Column(
                                  children: [
                                    texto(
                                        "% : Módulo (resto de la división).",
                                        fontApp,
                                        bigSize,
                                        negroColor,
                                        TextAlign.center),
                                    Image.asset(
                                      "images/fundamentos/modulo.png",
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
                          texto("Precedencia de Operadores", fontApp, bigSize,
                              azulOscColor, TextAlign.center),
                          separadorVertical(context, 1),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Orden de operaciones: ",
                                  style: TextStyle(
                                    fontFamily: fontExtraBold,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "En matemáticas y en programación, el orden de operaciones es fundamental.",
                                  style: TextStyle(
                                    fontFamily: fontApp,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          separadorVertical(context, 1),
                          Column(
                            children: [
                              texto(
                                  "Primero se realizan las operaciones entre paréntesis.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.center),
                              separadorVertical(context, 1),
                              texto(
                                  "Luego multiplicaciones y divisiones.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.center),
                              separadorVertical(context, 1),
                              texto(
                                  "Luego multiplicaciones y divisiones.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.center),
                              separadorVertical(context, 1),
                              texto("Ejemplo: resultado = (a + b) * c", fontApp,
                                  bigSize, negroColor, TextAlign.center),
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
                        ]))
                  ]))))
        ]));
  }
}
