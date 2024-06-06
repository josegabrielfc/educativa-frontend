import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhilePage extends StatefulWidget {
  static const name = 'while-page';
  const WhilePage({super.key});

  @override
  State<WhilePage> createState() => _WhilePageState();
}

class _WhilePageState extends State<WhilePage> {
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
                provider.setSidebarItem(SidebarItem.ciclosDoWhile);
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
                    separadorVertical(context, 3),
                    texto("Bucles While", fontExtraBold, bigSize + 24,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: texto(
                          "Un ciclo while es una estructura de control en programación que permite ejecutar repetidamente un bloque de código mientras una condición especificada sea verdadera. A diferencia de otros tipos de bucles, como el for, el ciclo while se utiliza cuando no se sabe de antemano cuántas veces debe repetirse el bloque de código.",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 3),
                    Divider(
                      color: azulClaColor, // Color de la línea
                      thickness: 1, // Grosor de la línea
                      indent: 2, // Espaciado desde el borde izquierdo
                      endIndent: 2, // Espaciado desde el borde derecho
                    ),
                    separadorVertical(context, 2),
                    texto("Sintaxis Basica", fontExtraBold, bigSize + 8,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.7,
                      child: texto(
                          "La sintaxis de un ciclo while es sencilla y consta de los siguientes elementos.",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto(
                                          "Ejemplo en Python",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/py_while1.png",
                                        height: 200,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto(
                                          "Ejemplo en C++",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/java_while1.png",
                                        height: 200,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto(
                                          "Ejemplo en Java",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/java_while1.png",
                                        height: 200,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    separadorVertical(context, 3),
                    texto(
                        "Condición: Es una expresión que se evalúa antes de cada iteración del bucle. Si la condición es verdadera, el bucle ejecuta el bloque de código; si es falsa, el bucle se detiene.\nBloque de Código: Es el conjunto de instrucciones que se ejecutarán repetidamente mientras la condición sea verdadera.",
                        fontMedium,
                        bigSize,
                        negroColor,
                        TextAlign.center),
                    separadorVertical(context, 5),
                    texto("Componentes del ciclo 'While'", fontExtraBold,
                        extraBigSize, azulColor, TextAlign.start),
                    separadorVertical(context, 2),
                    SizedBox(
                      child: DataTable(
                        columnSpacing: 20,
                        border: TableBorder.all(
                            borderRadius: BorderRadius.circular(20),
                            color: azulColor),
                        columns: [
                          DataColumn(
                            label: texto(
                                'Componentes de un\nWhile',
                                fontExtraBold,
                                bigSize + 2,
                                azulOscColor,
                                TextAlign.center),
                          ),
                          DataColumn(
                            label: texto('Descripción', fontExtraBold,
                                bigSize + 2, azulOscColor, TextAlign.center),
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(texto('Inicialización', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es el punto donde se establece el valor inicial de las variables que controlan el bucle.\nEsto se realiza antes de que el bucle comience a ejecutarse.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Condición', fontBold, bigSize,
                                  negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es una expresión booleana que se evalúa antes de cada iteración del bucle.\nSi la condición es verdadera, el bloque de código dentro del bucle se ejecuta.\nSi es falsa, el bucle termina.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Cuerpo del Bucle', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es el bloque de código que se ejecuta repetidamente mientras la condición sea verdadera.\nEste bloque puede contener cualquier cantidad de instrucciones y llamadas a funciones.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Actualización', fontBold, bigSize,
                                  negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Es el punto donde se modifican las variables utilizadas en la condición para eventualmente hacer que la condición\nse vuelva falsa y el bucle termine.La actualización debe ser diseñada cuidadosamente para evitar bucles infinitos.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separadorVertical(context, 5),
                    Divider(
                      color: azulClaColor, // Color de la línea
                      thickness: 1, // Grosor de la línea
                      indent: 2, // Espaciado desde el borde izquierdo
                      endIndent: 2, // Espaciado desde el borde derecho
                    ),
                    separadorVertical(context, 3),
                    texto("Ejemplo Básico", fontExtraBold, extraBigSize,
                        azulColor, TextAlign.start),
                    separadorVertical(context, 2),
                    texto(
                        "Un ejemplo clásico del uso de un ciclo 'while' es imprimir los números del 1 al 5.",
                        fontApp,
                        bigSize,
                        negroColor,
                        TextAlign.start),
                    separadorVertical(context, 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto(
                                          "Python",
                                          fontExtraBold,
                                          bigSize + 2,
                                          negroColor,
                                          TextAlign.start),
                                      Image.asset(
                                        "images/bucles/py_while2.png",
                                        height: 225,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto("C++", fontExtraBold, bigSize + 2,
                                          negroColor, TextAlign.start),
                                      Image.asset(
                                        "images/bucles/cpp_while2.png",
                                        height: 225,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.25,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: negroClaColor.withOpacity(0.6),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(3, 4),
                                    )
                                  ],
                                  color: Colors.grey[350],
                                ),
                                width: size.width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      texto("Java", fontExtraBold, bigSize + 2,
                                          negroColor, TextAlign.start),
                                      Image.asset(
                                        "images/bucles/java_while2.png",
                                        height: 225,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    separadorVertical(context, 5),
                    texto("Conclusión", fontExtraBold, extraBigSize, azulOscColor, TextAlign.start),
                    separadorVertical(context, 1),
                    texto(
                        "El ciclo while es una herramienta poderosa y flexible que permite realizar repeticiones basadas en condiciones. Comprender cómo utilizar el ciclo while correctamente es esencial para desarrollar algoritmos eficientes y evitar errores comunes como los bucles infinitos.\n\nEn el siguiente tema, exploraremos en detalle otro tipo de bucle: el ciclo for, que es útil para iteraciones conocidas y estructuradas.",
                        fontMedium,
                        bigSize,
                        grisOscColor,
                        TextAlign.center),
                    separadorVertical(context, 3),
                  ]),
                ),
              ))
        ]));
  }
}
