import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const name = "home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Container(
        alignment: Alignment.topLeft,
        padding:
            EdgeInsets.only(left: size.width * 0.11, top: size.height * 0.18),
        child: CustomButton(
            color: azulOscColor,
            hoverColor: azulClaColor,
            size: bigSize + 4,
            textButton: 'Iniciar OVA',
            heightButton: size.height * 0.065,
            widthButton:
                selectDevice(web: 0.22, cel: 0.64, sizeContext: size.width),
            sizeBorderRadius: 15,
            duration: 1000,
            onTap: () async {
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, "ova-page");
            }),
      ),
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent.withOpacity(0.5),
            body: Column(
              children: [
                Image.asset(
                  'assets/images/background.png',
                  width: size.width,
                  height: size.height * 0.4,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                    color: blancoColor,
                  ),
                  child: Column(
                    children: [
                      separadorVertical(context, 2),
                      texto(
                        "Contenidos del OVA",
                        fontExtraBold,
                        24,
                        azulOscColor,
                        TextAlign.center,
                      ),
                      separadorVertical(context, 1),
                      SizedBox(
                        width: size.width * 0.6,
                        child: texto(
                          "El objetivo de este OVA es brindar una introducción al mundo de la programación. A través de sus fundamentos, aprenderás los conceptos básicos y las habilidades esenciales que te permitirán entender y escribir tus propios programas.",
                          fontApp,
                          20,
                          negroColor,
                          TextAlign.justify,
                        ),
                      ),
                      separadorVertical(context, 2),
                      Expanded(
                        child: ListView(
                          children: [
                            ExpansionTile(
                              title: texto(
                                "1. Fundamentos del Lenguaje de Programación",
                                fontApp,
                                20,
                                azulOscColor,
                                TextAlign.center,
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: texto(
                                    '1.1. Estructura General del Lenguaje',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: texto(
                                    '1.2. Variables – Identificador y Tipo de Dato',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: texto(
                                    '1.3. Instrucciones de entrada/salida por consola estándar (Teclado y Pantalla)',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: texto(
                                    '1.4. Operadores de Asignación y Aritméticos',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: texto(
                                    '1.5. Operadores Relacionales y Lógicos',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: texto(
                                "2. Bloques Condicionales",
                                fontApp,
                                20,
                                azulOscColor,
                                TextAlign.center,
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: texto(
                                    '2.1. Bloque condicional if/else',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: texto(
                                      '2.1.1. Tipos de If',
                                      fontApp,
                                      18,
                                      negroColor,
                                      TextAlign.center,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: texto(
                                    '2.2. Sentencia de selección múltiple switch',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: texto(
                                "3. Bloques Iterativos",
                                fontApp,
                                20,
                                azulOscColor,
                                TextAlign.center,
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: texto(
                                    '3.1. Ciclos while',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: texto(
                                    '3.2. Ciclos do-while',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: texto(
                                    '3.3. Ciclos for',
                                    fontApp,
                                    18,
                                    negroColor,
                                    TextAlign.center,
                                  ),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: texto(
                                      '3.3.1. Uso estándar',
                                      fontApp,
                                      18,
                                      negroColor,
                                      TextAlign.center,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: texto(
                                      '3.3.2. Equivalencia con ciclo while',
                                      fontApp,
                                      18,
                                      negroColor,
                                      TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
