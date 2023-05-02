import 'package:pruebamattsa/domain/models/customer/customer.dart';

import '../../../widgets/widgets.dart';
import 'package:flutter/material.dart';

class DropdownCustom extends StatefulWidget {
  List<Customer> customersAux = [];
  String? actualval;
  final String name;
  final Future<List<Customer>> customers;

  DropdownCustom({super.key, required this.name, required this.customers});

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
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
                    child: FutureBuilder<List<Customer>>(
                        future: widget.customers,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: DropdownButtonFormField<String>(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                dropdownColor: Colors.white,
                                value:
                                    snapshot.data!.first.IdCustomer.toString(),
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
                                              fc.CodCustomer,
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          value: fc.IdCustomer.toString(),
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
