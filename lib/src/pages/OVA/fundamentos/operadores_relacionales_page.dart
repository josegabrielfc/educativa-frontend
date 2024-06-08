import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/resultado/resultado_models.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/service_provider.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/providers/usuario_provider.dart';
import 'package:educativa_frontend/src/widgets/inputs.dart';
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
  bool actividad = false;

  List<String> itemsCodigoC = [
    "A) bool esDivisible = (numero % 3 == 0) && (numero % 5 == 0);",
    'B) std::cout << "El número es divisible por 3 y 5: " << esDivisible << std::endl;',
    "C) int numero = 15;"
  ];

  List<String> itemsCodigoJava = [
    "A) boolean esMayorOPar = (numero > 50) || (numero % 2 == 0);",
    "B) int numero = 42;",
    'C) System.out.println("El número es mayor que 50 o es par: " + esMayorOPar);'
  ];

  List<String> itemsCodigoPython = [
    'A) print("Es elegible para votar: ", es_elegible)',
    "B) es_elegible = (edad >= 18) and es_ciudadano",
    "C) es_ciudadano = True",
    "D) edad = 20"
  ];

  String? item1CodigoC;
  String? item2CodigoC;
  String? item3CodigoC;

  String? item1CodigoJava;
  String? item2CodigoJava;
  String? item3CodigoJava;

  String? item1CodigoPython;
  String? item2CodigoPython;
  String? item3CodigoPython;
  String? item4CodigoPython;

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
                        bigSize + 8, azulColor, TextAlign.center),
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
                              azulColor, TextAlign.center),
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
                              azulColor, TextAlign.center),
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
                                    texto("or : O lógico.", fontApp, bigSize,
                                        negroColor, TextAlign.center),
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
                                    texto("not : Negación lógica.", fontApp,
                                        bigSize, negroColor, TextAlign.center),
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
                          CustomButton(
                              color: azulOscColor,
                              hoverColor: azulClaColor,
                              size: bigSize + 4,
                              textButton: 'Realizar actividad',
                              heightButton: 45,
                              widthButton: selectDevice(
                                  web: 0.22,
                                  cel: 0.64,
                                  sizeContext: size.width),
                              sizeBorderRadius: 15,
                              duration: 1000,
                              onTap: () {
                                setState(() {
                                  actividad = !actividad;
                                });
                              }),
                          actividad
                              ? Column(children: [
                                  separadorVertical(context, 2),
                                  texto(
                                      "1. Ordena las siguientes líneas de código para verificar si un número es divisible por 3 y 5:",
                                      fontApp,
                                      bigSize,
                                      negroColor,
                                      TextAlign.center),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          texto(
                                              itemsCodigoC[0],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              itemsCodigoC[1],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              itemsCodigoC[2],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                        ],
                                      ),
                                      separadorHorizontal(context, 2),
                                      Column(
                                        children: [
                                          GenericDropdown(
                                              value: item1CodigoC,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item1CodigoC = newValue!;
                                                });
                                              },
                                              items: itemsCodigoC,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                          separadorVertical(context, 1),
                                          GenericDropdown(
                                              value: item2CodigoC,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item2CodigoC = newValue!;
                                                });
                                              },
                                              items: itemsCodigoC,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                          separadorVertical(context, 1),
                                          GenericDropdown(
                                              value: item3CodigoC,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item3CodigoC = newValue!;
                                                });
                                              },
                                              items: itemsCodigoC,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                        ],
                                      )
                                    ],
                                  ),
                                  separadorVertical(context, 3),
                                  texto(
                                      "2. Ordena las siguientes líneas de código para verificar si un número es mayor que 50 o es par:",
                                      fontApp,
                                      bigSize,
                                      negroColor,
                                      TextAlign.center),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          texto(
                                              itemsCodigoJava[0],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              itemsCodigoJava[1],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              itemsCodigoJava[2],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                        ],
                                      ),
                                      separadorHorizontal(context, 2),
                                      Column(
                                        children: [
                                          GenericDropdown(
                                              value: item1CodigoJava,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item1CodigoJava = newValue!;
                                                });
                                              },
                                              items: itemsCodigoJava,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                          separadorVertical(context, 1),
                                          GenericDropdown(
                                              value: item2CodigoJava,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item2CodigoJava = newValue!;
                                                });
                                              },
                                              items: itemsCodigoJava,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                          separadorVertical(context, 1),
                                          GenericDropdown(
                                              value: item3CodigoJava,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item3CodigoJava = newValue!;
                                                });
                                              },
                                              items: itemsCodigoJava,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                        ],
                                      )
                                    ],
                                  ),
                                  separadorVertical(context, 3),
                                  texto(
                                      "3. Ordena las siguientes líneas de código para verificar si una persona es elegible para votar (mayor de 18 años) y es ciudadano:",
                                      fontApp,
                                      bigSize,
                                      negroColor,
                                      TextAlign.center),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          texto(
                                              itemsCodigoPython[0],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              itemsCodigoPython[1],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              itemsCodigoPython[2],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              itemsCodigoPython[3],
                                              fontApp,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                        ],
                                      ),
                                      separadorHorizontal(context, 2),
                                      Column(
                                        children: [
                                          GenericDropdown(
                                              value: item1CodigoPython,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item1CodigoPython = newValue!;
                                                });
                                              },
                                              items: itemsCodigoPython,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                          separadorVertical(context, 1),
                                          GenericDropdown(
                                              value: item2CodigoPython,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item2CodigoPython = newValue!;
                                                });
                                              },
                                              items: itemsCodigoPython,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                          separadorVertical(context, 1),
                                          GenericDropdown(
                                              value: item3CodigoPython,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item3CodigoPython = newValue!;
                                                });
                                              },
                                              items: itemsCodigoPython,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                          separadorVertical(context, 1),
                                          GenericDropdown(
                                              value: item4CodigoPython,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  item4CodigoPython = newValue!;
                                                });
                                              },
                                              items: itemsCodigoPython,
                                              width: 400,
                                              heigth: 35,
                                              hint: "Selecciona una opcion"),
                                        ],
                                      )
                                    ],
                                  ),
                                  separadorVertical(context, 1),
                                  CustomButton(
                                      color: azulOscColor,
                                      hoverColor: azulClaColor,
                                      size: bigSize + 4,
                                      textButton: 'Enviar',
                                      heightButton: 45,
                                      widthButton: selectDevice(
                                          web: 0.22,
                                          cel: 0.64,
                                          sizeContext: size.width),
                                      sizeBorderRadius: 15,
                                      duration: 1000,
                                      onTap: () async {
                                        await validarRespuestas();
                                      }),
                                ])
                              : Container(),
                          separadorVertical(context, 3),
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

  Future<void> validarRespuestas() async {
    List<String> correctOrderC = [
      "C) int numero = 15;",
      "A) bool esDivisible = (numero % 3 == 0) && (numero % 5 == 0);",
      'B) std::cout << "El número es divisible por 3 y 5: " << esDivisible << std::endl;'
    ];

    List<String> correctOrderJava = [
      "B) int numero = 42;",
      "A) boolean esMayorOPar = (numero > 50) || (numero % 2 == 0);",
      'C) System.out.println("El número es mayor que 50 o es par: " + esMayorOPar);'
    ];

    List<String> correctOrderPython = [
      "D) edad = 20",
      "C) es_ciudadano = True",
      "B) es_elegible = (edad >= 18) and es_ciudadano",
      'A) print("Es elegible para votar: ", es_elegible)'
    ];
    double puntaje = 0;

    if (item1CodigoC == correctOrderC[0] &&
        item2CodigoC == correctOrderC[1] &&
        item3CodigoC == correctOrderC[2]) {
      puntaje += 1;
    }

    if (item1CodigoJava == correctOrderJava[0] &&
        item2CodigoJava == correctOrderJava[1] &&
        item3CodigoJava == correctOrderJava[2]) {
      puntaje += 1;
    }

    if (item1CodigoPython == correctOrderPython[0] &&
        item2CodigoPython == correctOrderPython[1] &&
        item3CodigoPython == correctOrderPython[2] &&
        item4CodigoPython == correctOrderPython[3]) {
      puntaje += 1;
    }
    puntaje = (puntaje / 3) * 100;
    String mensaje;
    if (puntaje == 100) {
      mensaje = "¡Todas las respuestas son correctas! Puntaje: $puntaje";
    } else if (puntaje >= 60 && puntaje <= 99) {
      mensaje =
          "Muy bien, casi todas las respuestas son correctas. Puntaje: $puntaje";
    } else {
      mensaje = "Puntaje bajo. Inténtalo de nuevo. Puntaje: $puntaje";
    }
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);

    String token = usuarioProvider.token!;
    String usuarioId = usuarioProvider.usuario!;
    String temaId = usuarioProvider
        .buscarTemaPorNombre("Operadores Relacionales y Lógicos")!;
    ResultadoForm resultado =
        ResultadoForm(puntaje: puntaje, temaId: temaId, usuarioId: usuarioId);

    final serviceProvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response = await serviceProvider.resultadoService
        .registrarResultado(resultado, token);

    showDialog(
      barrierDismissible: false,
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertaVolver(
        width: 200,
        height: 210,
        function: () {
          Navigator.of(context).pop();
          setState(() {
            item1CodigoC = null;
            item2CodigoC = null;
            item3CodigoC = null;
            item1CodigoJava = null;
            item2CodigoJava = null;
            item3CodigoJava = null;
            item1CodigoPython = null;
            item2CodigoPython = null;
            item3CodigoPython = null;
            item4CodigoPython = null;
          });
        },
        widthButton: 10,
        textoBoton: 'Volver',
        image: response.type == "success"
            ? Image.asset("assets/images/success.png", height: 80)
            : Image.asset("assets/images/warning.jpg", height: 80),
        mensaje: response.type == "success" ? mensaje : response.msg,
        dobleBoton: false,
      ),
    );
  }
}
