import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';

class EquivalenciaWhilePage extends StatefulWidget {
  static const name = 'equivalencia-while-page';
  const EquivalenciaWhilePage({super.key});

  @override
  State<EquivalenciaWhilePage> createState() => _EquivalenciaWhilePageState();
}

class _EquivalenciaWhilePageState extends State<EquivalenciaWhilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(backgroundColor: const Color(0xFFC2F8FA)),
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
                    separadorVertical(context, 3),
                    texto("Equivalencia del Ciclo 'for' con el Ciclo 'while'", fontExtraBold, bigSize + 24,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: texto(
                          "En programación, cualquier ciclo for se puede convertir en un ciclo while. La conversión implica separar los componentes del ciclo for (inicialización, condición y actualización) en las partes correspondientes de un ciclo while. Aquí aprenderas cómo hacerlo en Python, Java y C++.",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 4),
                    Divider(
                          color: azulClaColor, // Color de la línea
                          thickness: 1, // Grosor de la línea
                          indent: 2, // Espaciado desde el borde izquierdo
                          endIndent: 2, // Espaciado desde el borde derecho
                        ),
                        separadorVertical(context, 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width * 0.275,
                              child: Column(
                                children: [
                                  texto("Ejemplo 'Ciclo for' (Python)", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "images/bucles/py_for1.png",
                                    width: 300,
                                  ),
                                  separadorVertical(context, 2),
                                  texto("Ejemplo 'Ciclo while' (Python)", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "images/bucles/py_for_while.png",
                                    width: 300,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.275,
                              child: Column(
                                children: [
                                  texto("Ejemplo 'Ciclo for' (C++)", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "images/bucles/cpp_for.png",
                                    width: 300,
                                  ),
                                  separadorVertical(context, 2),
                                  texto("Ejemplo 'Ciclo while' (C++)", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "images/bucles/cpp_for_while.png",
                                    width: 300,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.275,
                              child: Column(
                                children: [
                                  texto("Ejemplo 'Ciclo for' (Java)", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "images/bucles/java_for.png",
                                    width: 300,
                                  ),
                                  separadorVertical(context, 2),
                                  texto("Ejemplo 'Ciclo while' (Java)", fontApp,
                                      bigSize, negroColor, TextAlign.center),
                                  Image.asset(
                                    "images/bucles/java_for_while.png",
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
                    separadorVertical(context, 5),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          texto("Características", fontExtraBold,
                              extraBigSize, azulColor, TextAlign.start),
                          separadorVertical(context, 2),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: texto("1. Inicialización:", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "En el ciclo for, la inicialización se realiza dentro de la declaración del bucle. En el ciclo while, la inicialización se realiza antes de que el bucle comience.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                              ListTile(
                                leading: texto("2. Condición:", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "En el ciclo for, la condición se verifica en cada iteración antes de ejecutar el bloque de código. En el ciclo while, la condición también se verifica en cada iteración antes de ejecutar el bloque de código.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                              ListTile(
                                leading: texto("3. Actualización:", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "En el ciclo for, la actualización de la variable de control se realiza al final de cada iteración. En el ciclo while, la actualización debe hacerse explícitamente al final del bloque de código dentro del bucle.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separadorVertical(context, 7),
                    texto("Al comprender estas equivalencias, puedes convertir cualquier ciclo for en un ciclo while y viceversa, adaptando tu código a las necesidades específicas del lenguaje y del problema que estás resolviendo.", fontBold, bigSize + 4, grisOscColor, TextAlign.center),
                    separadorVertical(context, 3),
                  ]),
                ),
              ))
        ]));
  }
}