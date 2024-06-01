import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EstructuraPage extends StatefulWidget {
  static const name = 'estructura-page';
  const EstructuraPage({super.key});

  @override
  State<EstructuraPage> createState() => _EstructuraPageState();
}

class _EstructuraPageState extends State<EstructuraPage> {
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
        body: Stack(
          children: [
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
                      texto("Estructura General del Lenguaje", fontExtraBold,
                          bigSize + 8, azulOscColor, TextAlign.center),
                      separadorVertical(context, 2),
                      SizedBox(
                          width: size.width * 0.9,
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "La estructura general del lenguaje se refiere ",
                                  style: TextStyle(
                                    fontFamily: fontApp,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "a la forma y organización básica de un programa ",
                                  style: TextStyle(
                                    fontFamily: fontApp,
                                    fontSize: bigSize,
                                    color: azulOscColor,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "en un lenguaje de programación específico. Esta estructura incluye las reglas y convenciones que determinan cómo se escriben y organizan los programas.",
                                  style: TextStyle(
                                    fontFamily: fontApp,
                                    fontSize: bigSize,
                                    color: negroColor,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      separadorVertical(context, 2),
                      SizedBox(
                          width: size.width * 0.9,
                          child: Column(
                            children: [
                              texto("Sintaxis", fontBold, bigSize, azulOscColor,
                                  TextAlign.start),
                              texto(
                                  "La sintaxis de un lenguaje de programación son las reglas que definen las combinaciones de símbolos que se consideran correctamente estructuradas en ese lenguaje. La sintaxis incluye:",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start),
                              separadorVertical(context, 2),
                              Divider(
                                color: azulClaColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Comentarios: ",
                                      style: TextStyle(
                                        fontFamily: fontExtraBold,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Son anotaciones en el código que no son ejecutadas por el programa, utilizadas para explicar el código o desactivarlo temporalmente.",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto("En Python", fontApp, bigSize,
                                            negroColor, TextAlign.center),
                                        Image.asset("images/comentario2.png")
                                      ],
                                    ),
                                  ),
                                  separadorHorizontal(context, 2),
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto("En C++", fontApp, bigSize,
                                            negroColor, TextAlign.center),
                                        Image.asset("images/comentario1.png")
                                      ],
                                    ),
                                  ),
                                  separadorHorizontal(context, 2),
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto("En Java", fontApp, bigSize,
                                            negroColor, TextAlign.center),
                                        Image.asset("images/comentario1.png")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: azulClaColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Declaraciones y Expresiones: ",
                                      style: TextStyle(
                                        fontFamily: fontExtraBold,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Son las unidades básicas de código que realizan acciones.",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto(
                                            "Ejemplo en Python",
                                            fontApp,
                                            bigSize,
                                            negroColor,
                                            TextAlign.center),
                                        Image.asset("images/declaracion2.png", height: 200,)
                                      ],
                                    ),
                                  ),
                                  separadorHorizontal(context, 2),
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto(
                                            "Ejemplo en C++",
                                            fontApp,
                                            bigSize,
                                            negroColor,
                                            TextAlign.center),
                                        Image.asset("images/declaracion1.png", height: 200,)
                                      ],
                                    ),
                                  ),
                                  separadorHorizontal(context, 2),
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto(
                                            "Ejemplo en Java",
                                            fontApp,
                                            bigSize,
                                            negroColor,
                                            TextAlign.center),
                                        Image.asset("images/declaracion1.png", height: 200,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: azulClaColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Funciones Principales: ",
                                      style: TextStyle(
                                        fontFamily: fontExtraBold,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Las funciones principales son el punto de entrada de cualquier programa. Son las primeras en ejecutarse cuando el programa empieza.",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              separadorVertical(context, 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  separadorVertical(context, 1),
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto(
                                            "En Python, no hay una función principal obligatoria, pero es una buena práctica definir:",
                                            fontApp,
                                            bigSize,
                                            negroColor,
                                            TextAlign.center),
                                        Image.asset(
                                          "images/principal-python.png",
                                          width: 400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  separadorHorizontal(context, 2),
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto("En C++:", fontApp, bigSize,
                                            negroColor, TextAlign.center),
                                        Image.asset(
                                          "images/principal-c.png",
                                          width: 400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  separadorHorizontal(context, 2),
                                  SizedBox(
                                    width: size.width * 0.25,
                                    child: Column(
                                      children: [
                                        texto("En Java:", fontApp, bigSize,
                                            negroColor, TextAlign.center),
                                        Image.asset(
                                          "images/principal-java.png",
                                          width: 400,
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
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              separadorVertical(context, 2),
                            ],
                          )),
                    ]))))
          ],
        ));
  }
}
