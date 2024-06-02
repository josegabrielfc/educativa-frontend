import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';
import 'package:educativa_frontend/src/providers/sidebar_provider.dart';
import 'package:educativa_frontend/src/widgets/sidebar_widget.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CondicionalesPage extends StatefulWidget {
  static const name = 'condicionales-page';
  const CondicionalesPage({super.key});

  @override
  State<CondicionalesPage> createState() => _CondicionalesPageState();
}

class _CondicionalesPageState extends State<CondicionalesPage> {
  
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
            },
          ),
        ),
        body: Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.transparent.withOpacity(0.11),
                body: SizedBox(
                    height: size.height,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Image.asset(
                          'images/background.png',
                          width: size.width,
                          height: size.height * 0.3,
                          fit: BoxFit.cover,
                        ),
                        separadorVertical(context, 2),
                        texto("Bloques Condicionales", fontExtraBold,
                            bigSize + 8, azulOscColor, TextAlign.center),
                        separadorVertical(context, 2),
                        SizedBox(
                            width: size.width * 0.5,
                            child: texto(
                                'No todos los problemas pueden resolverse empleando estructuras secuenciales. Cuando es necesario tomar una decisión se deben agregar a los diseños las estructuras condicionales. En la vida diaria se presentan situaciones donde es necesario decidir',
                                fontApp,
                                bigSize,
                                negroColor,
                                TextAlign.center)),
                        separadorVertical(context, 2),
                        SizedBox(
                            width: size.width * 0.9,
                            child: Column(
                              children: [
                                texto("Ejemplo", fontBold, bigSize,
                                    azulOscColor, TextAlign.start),
                                separadorVertical(context, 2),
                                texto(
                                    "• ¿Elijo la carrera A o la carrera B?\n• Para ir al trabajo, ¿elijo el camino A o el camino B?\n• Al cursar una carrera, ¿elijo el horario de la mañana, de la tarde o de la noche?\nPor ello, en un problema se combinan estructuras secuenciales con condicionales (y otras que se estudiarán más adelante).",
                                    fontApp,
                                    bigSize,
                                    negroColor,
                                    TextAlign.start),
                                separadorVertical(context, 2),
                                Divider(
                                  color: azulClaColor,
                                  thickness: 1,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                separadorVertical(context, 2),
                                Image.asset(
                                  'images/condicionales/condicionales_diagrama.jpg',
                                  width: 300,
                                  fit: BoxFit.contain,
                                ),
                                separadorVertical(context, 2),
                                texto("Ejemplos de Código", fontBold, bigSize,
                                    azulOscColor, TextAlign.start),
                                separadorVertical(context, 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Colors.grey[200],
                                      width: size.width * 0.3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          texto("Java", fontBold, bigSize,
                                              azulOscColor, TextAlign.start),
                                          texto(
                                              "public class Main {\n"
                                              "  public static void main(String[] args) {\n"
                                              "    int a = 5;\n"
                                              "    int b = 3;\n"
                                              "    if (a > b) {\n"
                                              "      System.out.println('a es mayor que b');\n"
                                              "    } else {\n"
                                              "      System.out.println('a no es mayor que b');\n"
                                              "    }\n"
                                              "  }\n"
                                              "}",
                                              fontApp,
                                              bigSize - 2,
                                              Colors.black87,
                                              TextAlign.start),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Colors.grey[200],
                                      width: size.width * 0.3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          texto("C++", fontBold, bigSize,
                                              azulOscColor, TextAlign.start),
                                          texto(
                                              "#include <iostream>\n"
                                              "using namespace std;\n"
                                              "int main() {\n"
                                              "  int a = 5;\n"
                                              "  int b = 3;\n"
                                              "  if (a > b) {\n"
                                              "    cout << 'a es mayor que b' << endl;\n"
                                              "  } else {\n"
                                              "    cout << 'a no es mayor que b' << endl;\n"
                                              "  }\n"
                                              "  return 0;\n"
                                              "}",
                                              fontApp,
                                              bigSize - 2,
                                              Colors.black87,
                                              TextAlign.start),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Colors.grey[200],
                                      width: size.width * 0.2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          texto("Python", fontBold, bigSize,
                                              azulOscColor, TextAlign.start),
                                          texto(
                                              "a = 5\n"
                                              "b = 3\n"
                                              "if a > b:\n"
                                              "    print('a es mayor que b')\n"
                                              "else:\n"
                                              "    print('a no es mayor que b')",
                                              fontApp,
                                              bigSize - 2,
                                              Colors.black87,
                                              TextAlign.start),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                separadorVertical(context, 2),
                                texto("Explicación del Código", fontBold,
                                    bigSize, azulOscColor, TextAlign.start),
                                texto(
                                    "En los ejemplos anteriores, tenemos dos variables enteras, a y b. Usamos un bloque condicional if-else para verificar si a es mayor que b. Si la condición es verdadera, se imprime 'a es mayor que b'. De lo contrario, se imprime 'a no es mayor que b'.",
                                    fontApp,
                                    bigSize,
                                    negroColor,
                                    TextAlign.start),
                                separadorVertical(context, 2),
                              ],
                            )),
                      ],
                    ))))
          ],
        ));
  }
}
