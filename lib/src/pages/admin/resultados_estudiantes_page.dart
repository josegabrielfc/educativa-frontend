import 'package:educativa_frontend/src/config/environment/environment.dart';
import 'package:educativa_frontend/src/models/resultado/resultado_models.dart';
import 'package:educativa_frontend/src/providers/service_provider.dart';
import 'package:educativa_frontend/src/providers/usuario_provider.dart';
import 'package:educativa_frontend/src/widgets/widgets_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultadosEstudiantePage extends StatefulWidget {
  static const name = 'resultados-estudiantes-page';
  const ResultadosEstudiantePage({super.key});

  @override
  State<ResultadosEstudiantePage> createState() =>
      _ResultadosEstudiantePageState();
}

class _ResultadosEstudiantePageState extends State<ResultadosEstudiantePage> {
  List<ResultadoModel>? resultados;
  bool isLoading = true;
  String nombre = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    final token = usuarioProvider.token!;
    final estudianteId = usuarioProvider.estudiante!;
    final serviceProvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final resultadoLoad = await serviceProvider.resultadoService
        .listarResultados(estudianteId, token);

    setState(() {
      resultados = resultadoLoad;
      nombre = resultadoLoad[0].usuario.nombre;
      isLoading = false;
    });
  }

  Widget tablaResultados(
      List<ResultadoModel> resultados, BuildContext context) {
    var media = MediaQuery.of(context).size;

    media =
        (media.width <= 1280) ? Size(media.width * 0.95, media.height) : media;
    media =
        (media.height <= 750) ? Size(media.width, media.height * 1.1) : media;
    media =
        (media.height <= 580) ? Size(media.width, media.height * 0.75) : media;
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            0: FixedColumnWidth(media.width * 17.4 / 100),
            1: FixedColumnWidth(media.width * 31.6 / 100),
            2: FixedColumnWidth(media.width * 9.4 / 100),
          },
          border: TableBorder.all(
              color: Colors.transparent, style: BorderStyle.none),
          children: [
            TableRow(
                decoration: BoxDecoration(
                  color: azulOscColor,
                ),
                children: [
                  Column(children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: texto(
                        "ORDEN",
                        fontBold,
                        bigSize + 4,
                        blancoColor,
                        TextAlign.end,
                      ),
                    ),
                  ]),
                  Column(children: [
                    texto(
                      "TEMA",
                      fontBold,
                      bigSize + 4,
                      blancoColor,
                      TextAlign.end,
                    ),
                  ]),
                  Column(children: [
                    texto(
                      "PUNTAJE",
                      fontBold,
                      bigSize + 4,
                      blancoColor,
                      TextAlign.end,
                    ),
                  ]),
                ]),
          ],
        ),
        SizedBox(
          height: media.height * 30 / 100,
          child: SingleChildScrollView(
            child: Table(
              columnWidths: {
                0: FixedColumnWidth(media.width * 17.4 / 100),
                1: FixedColumnWidth(media.width * 31.6 / 100),
                2: FixedColumnWidth(media.width * 9.4 / 100),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(
                  color: Colors.transparent, style: BorderStyle.none),
              children: [
                for (int index = 0; index < resultados.length; index++)
                  TableRow(
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? azulOscColor.withOpacity(0.2)
                            : blancoColor,
                      ),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: texto(
                            resultados[index].tema.orden.toString(),
                            fontApp,
                            bigSize + 4,
                            negroColor,
                            TextAlign.center,
                          ),
                        ),
                        Column(children: [
                          texto(
                            resultados[index].tema.nombre,
                            fontApp,
                            bigSize + 4,
                            negroColor,
                            TextAlign.center,
                          ),
                        ]),
                        Column(children: [
                          texto(
                            resultados[index].puntaje.toString(),
                            fontApp,
                            bigSize + 4,
                            negroColor,
                            TextAlign.center,
                          ),
                        ]),
                      ])
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: const Color.fromRGBO(142, 142, 142, 1),
            child: Column(
              children: [
                separadorVertical(context, 2),
                ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    size: 40,
                    color: blancoColor,
                  ),
                  title: texto("Cerrar sesión", fontBold, bigSize + 4,
                      blancoColor, TextAlign.center),
                  onTap: () {
                    final usuarioProvider =
                        Provider.of<UsuarioProvider>(context, listen: false);
                    usuarioProvider.vaciarUsuarioProvider();
                    Navigator.pushReplacementNamed(context, 'login-page');
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: azulColor,
          title: Text('Resultados del estudiante $nombre'),
          centerTitle: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          separadorVertical(context, 5),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else
            resultados!.isNotEmpty
                ? Center(
                  child: tablaResultados(
                      resultados!,
                      context,
                    ),
                )
                : Center(
                  child: Column(
                      children: [
                        Image.asset("images/no-data.png",
                            height: 200, color: azulOscColor),
                        texto("No se encontro información", fontApp, bigSize + 4,
                            azulOscColor, TextAlign.center)
                      ],
                    ),
                )
        ]));
  }
}
