import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CiclosPage extends StatefulWidget {
  static const name = 'ciclos-page';
  const CiclosPage({super.key});

  @override
  State<CiclosPage> createState() => _CiclosPageState();
}

class _CiclosPageState extends State<CiclosPage> {
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
                provider.setSidebarItem(SidebarItem.ciclosWhile);
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
                    texto("¿Qué es un Bucle?", fontExtraBold, bigSize + 24,
                        azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.5,
                      child: texto(
                          "Un bucle, también conocido como ciclo, es una estructura de control que permite repetir un bloque de código múltiples veces. Los bucles son fundamentales en la programación, ya que facilitan la automatización de tareas repetitivas, permitiendo que un programa ejecute una misma acción varias veces de manera eficiente.",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 4),
                    texto("¿Por qué son importantes los Bucles?", fontExtraBold,
                        bigSize + 8, azulOscColor, TextAlign.center),
                    separadorVertical(context, 2),
                    SizedBox(
                      width: size.width * 0.7,
                      child: texto(
                          "Los bucles son esenciales para realizar tareas que requieren repetición, como procesar elementos de una lista, realizar cálculos iterativos, o controlar dispositivos de hardware en un bucle continuo. Utilizar bucles ahorra tiempo y esfuerzo, además de mejorar la legibilidad y el mantenimiento del código.",
                          fontApp,
                          bigSize,
                          negroColor,
                          TextAlign.justify),
                    ),
                    separadorVertical(context, 4),
                    texto("Tipos de bucles", fontBold, bigSize + 4,
                        azulOscColor, TextAlign.start),
                    separadorVertical(context, 2.5),
                    SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: azulOscColor, width: 1.5),
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [azulColor, azulClaColor])),
                            width: size.width * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  texto("Bucles 'while'", fontBold, bigSize + 2,
                                      blancoColor, TextAlign.start),
                                ],
                              ),
                            ),
                          ),
                          //separadorHorizontal(context, 2),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: azulOscColor, width: 1.5),
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [azulColor, azulClaColor])),
                            width: size.width * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  texto(
                                      "Bucles 'do-while'",
                                      fontBold,
                                      bigSize + 2,
                                      blancoColor,
                                      TextAlign.start),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: azulOscColor, width: 1.5),
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [azulColor, azulClaColor])),
                            width: size.width * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  texto("Bucles 'for'", fontBold, bigSize + 2,
                                      blancoColor, TextAlign.start),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    separadorVertical(context, 5),
                    SizedBox(
                      child: DataTable(
                        columnSpacing: 20,
                        border: TableBorder.all(
                            borderRadius: BorderRadius.circular(20),
                            color: azulColor),
                        columns: [
                          DataColumn(
                            label: texto(
                                'Componentes básicos\n de un Bucle',
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
                                  'Es el punto de partida donde se establece el valor inicial de las variables involucradas en el bucle.',
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
                                  'Es una expresión que se evalúa antes de cada iteración del bucle. Si la condición es verdadera,\nel bucle sigue ejecutándose; si es falsa, el bucle se detiene.',
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
                                  'Es el bloque de código que se ejecuta repetidamente mientras la condición sea verdadera.',
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
                                  'Es la modificación de las variables utilizadas en la condición para eventualmente hacer que\nla condición se vuelva falsa y el bucle termine.',
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
                          texto("Ventajas de Utilizar Bucles", fontExtraBold,
                              extraBigSize, azulColor, TextAlign.start),
                          separadorVertical(context, 2),
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: texto("1.", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "Eficiencia: Los bucles permiten repetir tareas sin necesidad de duplicar código, lo que hace que el programa sea más compacto y eficiente.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                              ListTile(
                                leading: texto("2.", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "Automatización: Facilitan la automatización de tareas repetitivas, como el procesamiento de grandes cantidades de datos.",
                                  fontApp,
                                  bigSize,
                                  negroColor,
                                  TextAlign.start,
                                ),
                              ),
                              ListTile(
                                leading: texto("3.", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                title: texto(
                                  "Legibilidad: Ayudan a mantener el código limpio y fácil de entender, ya que reducen la redundancia.",
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
                    SizedBox(
                      width: size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          texto("Consideraciones Importantes", fontExtraBold,
                              extraBigSize, azulColor, TextAlign.start),
                          separadorVertical(context, 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: size.width * 0.39,
                                child: Column(
                                  children: [
                                    separadorVertical(context, 2.5),
                                    texto("Bucles Infinitos", fontBold, bigSize + 4,
                                        azulColor, TextAlign.center),
                                    separadorVertical(context, 1),
                                    texto(
                                      "Es crucial asegurarse de que los bucles tengan una condición de terminación. Un bucle sin una condición de salida adecuada puede convertirse en un bucle infinito, lo que puede hacer que el programa se bloquee.",
                                      fontApp,
                                      bigSize,
                                      negroColor,
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.35,
                                child: Column(
                                  children: [
                                    texto("Eficiencia", fontBold, bigSize + 4,
                                        azulColor, TextAlign.center),
                                    separadorVertical(context, 1),
                                    texto(
                                      "Es importante diseñar bucles eficientes para evitar sobrecargar el procesador o consumir recursos innecesariamente.",
                                      fontApp,
                                      bigSize,
                                      negroColor,
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separadorVertical(context, 7),
                    texto("En las siguientes unidades, aprenderemos como implementar cada uno de estos ciclos y su respectiva logica a la hora de programar c:", fontMedium, bigSize, grisOscColor, TextAlign.center),
                    separadorVertical(context, 3),
                  ]),
                ),
              ))
        ]));
  }
}
