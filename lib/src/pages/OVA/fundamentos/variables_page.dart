import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VariablesPage extends StatefulWidget {
  static const name = 'variables-page';
  const VariablesPage({super.key});

  @override
  State<VariablesPage> createState() => _VariablesPageState();
}

class _VariablesPageState extends State<VariablesPage> {
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
                provider.setSidebarItem(SidebarItem.variables);
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
                        "Variables – Identificador y Tipo de Dato",
                        fontExtraBold,
                        bigSize + 8,
                        azulOscColor,
                        TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          texto(
                              "Una variable es un espacio en memoria que se utiliza para almacenar datos que pueden cambiar durante la ejecución del programa. Un identificador es el nombre que se le da a una variable, y el tipo de dato define el tipo de información que se puede almacenar en esa variable.",
                              fontApp,
                              bigSize,
                              negroColor,
                              TextAlign.justify),
                          separadorVertical(context, 2),
                          texto("Variables", fontApp, bigSize, azulOscColor,
                              TextAlign.start),
                          separadorVertical(context, 1),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Según el lenguaje de programación, declarar una variable generalmente implica tres componentes principales: el tipo de dato, el identificador y el valor asignado a la variable.",
                                  style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " En Python, la declaración de variables es más sencilla y dinámica. No se especifica el tipo de dato explícitamente; el tipo se infiere del valor asignado.",
                                  style: TextStyle(
                                    fontFamily: fontApp,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " En cambio, en C++ y Java, declarar una variable incluye especificar el tipo de dato, el identificador y opcionalmente el valor inicial.",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("Ejemplo en Python", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/declaracion2.png",
                                      height: 200,
                                    )
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("Ejemplo en C++", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/declaracion1.png",
                                      height: 200,
                                    )
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.25,
                                child: Column(
                                  children: [
                                    texto("Ejemplo en Java", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/declaracion1.png",
                                      height: 200,
                                    )
                                  ],
                                ),
                              )
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
                          texto("Identificadores", fontApp, bigSize,
                              azulOscColor, TextAlign.start),
                          separadorVertical(context, 1),
                          texto(
                              "Los identificadores deben empezar con una letra (a-z, A-Z) o un guion bajo (_), seguido de letras, números (0-9) o guiones bajos.",
                              fontApp,
                              bigSize,
                              negroColor,
                              TextAlign.center),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              separadorVertical(context, 1),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Ejemplos validos", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/identificador1.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Ejemplos invalidos", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/identificador2.png",
                                      width: 300,
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
                          texto("Tipos de Datos", fontApp, bigSize,
                              azulOscColor, TextAlign.start),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              separadorVertical(context, 1),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Enteros (int): Números sin decimales.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/tipo-dato1.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Flotantes (float, double): Números con decimales.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/tipo-dato2.png",
                                      width: 300,
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
                              separadorVertical(context, 1),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Cadenas de texto (str, string): Secuencias de caracteres.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/tipo-dato3.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                              separadorHorizontal(context, 2),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Booleanos (bool): Valores de verdadero o falso.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
                                    Image.asset(
                                      "images/tipo-dato4.png",
                                      width: 300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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