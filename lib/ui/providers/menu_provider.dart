import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

import '../utils/clases.dart';
import '../utils/icono_string_util.dart';
import '../widgets/widgets.dart';

class _MenuProvider {
  List<dynamic> opciones = [];
  List<dynamic> items = [];
  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }

  void cargarEvidenceCarga(String name) async {
    final resp = await rootBundle.loadString('data/evidencecarga.json');

    Map dataMap = json.decode(resp);
    items = dataMap[name];
    print(items);
  }

  List<Item> carga(String name) {
    List<Item> p = [];

    switch (name) {
      case 'cero':
        p.add(Item('0', "Estructural", false));
        p.add(Item('1', "Electrico", false));
        break;
      case 'amarillo':
        p.add(Item('0', "Miscelaneo", false));
        break;
      case 'rojo':
        p.add(Item('0', "Mecanico", false));
        p.add(Item('1', "Refractario", false));
        break;
    }
    return p;
  }

  List<Item> cargashowitem(String type) {
    List<Item> p = [];
    switch (type) {
      case '0':
        p.add(Item('0', "0% No funciona", false));
        break;
      case '25':
        p.add(Item('0', "25% Puede Fallar", false));
        break;
      case '50':
        p.add(Item('0', "50% Funciona pero requiere mantenimineto", false));
        break;
      case 'OT':
        p.add(Item('0', "O.T.", false));
        break;
      case 'Refacciones':
        p.add(Item('0', "Refacciones", false));
        break;
      case 'Entregables':
        p.add(Item('0', "Entregables", false));
        break;
      case 'Infg':
        p.add(Item('0', "Informacion General", false));
        break;
    }

    return p;
  }

  List<Widget> cargashow(String name) {
    List<Widget> widgets = [];

    switch (name) {
      case 'cero':
        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text("Estructural"),
              ),
            ),
            Expanded(
              flex: 6,
              child: MovieSlider(),
            )
          ],
        ));
        widgets.add(Title(
            color: Colors.black,
            child: Text(
              "Actividades y refacciones",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )));
        widgets.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: ListTile(
                    title: Text(
                      "MTTO reciculadro de atmosfera",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 'info':
        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  'Valeo',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.black, 20),
              ),
            ),
          ],
        ));
        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  'Car Bottom',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.black, 20),
              ),
            ),
          ],
        ));
        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  'Mantenimiento',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.black, 20),
              ),
            ),
          ],
        ));

        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '0%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: Center(child: Text("1")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '25%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: Center(child: Text("2")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 220, 150, 44)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '50%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: Center(child: Text("2")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.green),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '100%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: Center(child: Text("2")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
        break;
      case 'infov2':
        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  'Valeo',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.black, 20),
              ),
            ),
          ],
        ));
        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  'Car Bottom',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.black, 20),
              ),
            ),
          ],
        ));
        widgets.add(Row(
          children: [
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  'Mantenimiento',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.black, 20),
              ),
            ),
          ],
        ));

        break;
    }
    return widgets;
  }

  List<Widget> cargaothers(String name) {
    List<Widget> widgets = [];

    switch (name) {
      case 'OT':
        widgets.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: ListTile(
                    title: Text(
                      "MTTO reciculadro de atmosfera",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        widgets.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: ListTile(
                    title: Text(
                      "MTTO reciculadro de atmosfera",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        widgets.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: ListTile(
                    title: Text(
                      "MTTO reciculadro de atmosfera",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
    }

    return widgets;
  }
}

final menuProvider = new _MenuProvider();
