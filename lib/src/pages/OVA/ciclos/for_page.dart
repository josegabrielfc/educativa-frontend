import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForPage extends StatefulWidget {
  static const name = 'for-page';
  const ForPage({super.key});

  @override
  State<ForPage> createState() => _ForPageState();
}

class _ForPageState extends State<ForPage> {
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
                provider.setSidebarItem(SidebarItem.equivalenciaWhile);
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
                    texto("Bucles For", fontExtraBold, bigSize + 24,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: texto(
                          "El ciclo for es una estructura de control en programación que permite ejecutar repetidamente un bloque de código un número específico de veces. Es especialmente útil cuando se conoce de antemano el número de iteraciones que se necesitan. A diferencia del ciclo while, el ciclo for combina la inicialización, la condición y la actualización de la variable de control en una sola línea.",
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
                          "La sintaxis de un ciclo for es:",
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
                                        "images/bucles/py_for.png",
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
                                        "images/bucles/javacpp_for.png",
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
                                        "images/bucles/javacpp_for.png",
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
                        "Python:\n\nvariable: Es la variable de control que toma el valor de cada elemento del iterable en cada iteración.\niterable: Es cualquier objeto de Python que puede ser iterado (como listas, cadenas, rangos, etc.).\nBloque de Código: Conjunto de instrucciones que se ejecutan en cada iteración.\n\nJava & C++ :\n\nInicialización: Es la parte donde se inicializa la variable de control del bucle.\nCondición: Es una expresión booleana que se evalúa antes de cada iteración. Si es verdadera, el bloque de código se ejecuta. Si es falsa, el bucle termina.\nActualización: Es la modificación de la variable de control, que ocurre al final de cada iteración.",
                        fontMedium,
                        bigSize,
                        negroColor,
                        TextAlign.center),
                    separadorVertical(context, 5),
                    texto("Características del ciclo 'For'", fontExtraBold,
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
                                'Características de\nun ciclo For',
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
                              DataCell(texto('Iteraciones Definidas', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'El ciclo for es ideal cuando se conoce el número exacto de iteraciones que se deben realizar.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Control Compacto', fontBold, bigSize,
                                  negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'Combina la inicialización, la condición y la actualización de la variable de control\nen una sola línea, lo que hace el código más compacto y fácil de leer.',
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start)),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(texto('Iteración a través de Colecciones', fontBold,
                                  bigSize, negroColor, TextAlign.start)),
                              DataCell(texto(
                                  'En Python, el ciclo for es especialmente útil para iterar a través\nde colecciones\ncomo listas, tuplas y diccionarios.',
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
                     SizedBox(
                      width: size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          texto("Consideraciones Importantes", fontExtraBold,
                              extraBigSize, azulColor, TextAlign.start),
                          separadorVertical(context, 2),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: texto("1. Condición de Salida:", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "Es crucial asegurarse de que la condición del bucle se cumpla para evitar bucles infinitos.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                              ListTile(
                                leading: texto("2. Eficiencia:", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "Utilizar el ciclo for adecuadamente puede mejorar la eficiencia y legibilidad del código.",
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
                    separadorVertical(context, 4),
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
                        "Un ejemplo clásico del uso de un ciclo 'for' es imprimir los números del 1 al 5.",
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
                                        "images/bucles/py_for1.png",
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
                                        "images/bucles/cpp_for.png",
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
                                        "images/bucles/java_for.png",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: texto(
                          "El ciclo for es una herramienta poderosa y versátil en programación, adecuada para situaciones donde se necesita un número definido de iteraciones. Entender su sintaxis y características es esencial para escribir código limpio y eficiente.",
                          fontMedium,
                          bigSize,
                          grisOscColor,
                          TextAlign.center),
                    ),
                    separadorVertical(context, 3),
                  ]),
                ),
              ))
        ]));
  }
}