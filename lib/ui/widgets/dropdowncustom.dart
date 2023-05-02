import 'package:flutter/material.dart';

class dropdowncustom extends StatefulWidget {
  final String name;
  dropdowncustom({Key? key, this.name: null ?? "sin seleccionr"})
      : super(key: key);

  @override
  State<dropdowncustom> createState() => _dropdowncustomState();
}

class _dropdowncustomState extends State<dropdowncustom> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four', 'Five'];
  Color yourcolor = Colors.grey;
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
                  decoration: BoxDecoration(
                    color: yourcolor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    dropdownColor: Colors.grey,
                    value: list.first,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 0,
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 165, 165, 165)),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Name",
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        if (value != null) {
                          yourcolor = _getColor(value, yourcolor);
                        }
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: _getValueDrop(value),
                      );
                    }).toList(),
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget _getValueDrop(
    String value,
  ) {
    Widget conten;
    switch (value) {
      case "One":
        conten = const Text(
          "0% (NO FUNCIONAL)",
          style: TextStyle(color: Colors.white),
        );

        break;
      case "Two":
        conten = Container(
          child:
              Text("25% (PUEDE FALLAR)", style: TextStyle(color: Colors.white)),
        );
        break;
      case "Three":
        conten = Container(
          child: Text("50% (FUNCIONAl)", style: TextStyle(color: Colors.white)),
        );
        break;
      case "Four":
        conten = Container(
          child: Text("75% (PRESENTA FALLAS",
              style: TextStyle(color: Colors.white)),
        );
        break;
      default:
        conten = Container(
          child: Text("100% (OPTIMO)", style: TextStyle(color: Colors.white)),
        );
        break;
    }
    return conten;
  }

  Color _getColor(String value, Color type) {
    switch (value) {
      case "One":
        type = Colors.black;

        break;
      case "Two":
        type = Colors.red;
        break;
      case "Three":
        type = Color.fromARGB(255, 220, 150, 44);
        break;
      case "Four":
        type = Colors.green;
        break;
      default:
        type = Colors.blueAccent;
        break;
    }

    return type;
  }
}
