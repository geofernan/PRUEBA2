import 'package:pruebamattsa/domain/models/customer/customer.dart';
import 'package:pruebamattsa/domain/models/ovens/oven.dart';

import '../../../widgets/widgets.dart';
import 'package:flutter/material.dart';

class DropdownCustomOven extends StatefulWidget {
  List<Customer> customersAux = [];
  String? actualval;
  final String name;
  final Future<List<Oven>> ovens;

  DropdownCustomOven({super.key, required this.name, required this.ovens});

  @override
  State<DropdownCustomOven> createState() => _DropdownCustomOvenState();
}

class _DropdownCustomOvenState extends State<DropdownCustomOven> {
  Color yourcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
              )),
          Expanded(
            flex: 7,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                    child: FutureBuilder<List<Oven>>(
                        future: widget.ovens,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: DropdownButtonFormField<String>(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                dropdownColor: Colors.white,
                                value: snapshot.data!.first.idOven.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 0,
                                style: const TextStyle(color: Colors.grey),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 165, 165, 165)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "Name",
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    if (value != null) {
                                      print("hola");
                                      widget.actualval = value;
                                      print(widget.actualval);
                                      print("hola");
                                      // yourcolor = _getColor(value, yourcolor);
                                    }
                                  });
                                },
                                items: snapshot.data!
                                    .map((fc) => DropdownMenuItem<String>(
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              fc.nameOven,
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          value: fc.idOven.toString(),
                                        ))
                                    .toList(),
                              ),
                            );
                          }

                          return CircularProgressIndicator();
                        }))),
          )
        ],
      ),
    );
  }
}
