import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class CustomDropDown extends ConsumerStatefulWidget {
  final ValueChanged<String>? onChanged;
  final String type;
  final provider;
  const CustomDropDown(
      {required this.type, required this.provider, this.onChanged, super.key});

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends ConsumerState<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: widget.provider,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          //   List<DropdownMenuItem<String>> _options = snapshot.data!
          //   .map((fc) => DropdownMenuItem<String>(
          //     child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Text(
          //         fc.name ?? "sin hornos",
          //         style: TextStyle(color: Colors.red),
          //       ),
          //     ),
          //     value: fc.id.toString(),
          //   ))
          //   .toList();

          // List<String?> _values = _options.map((option) => option.value).toList();

          // if (_values.toSet().length != _values.length) {
          //   // Hay valores duplicados en la lista, se debe corregir.
          //   // Por ejemplo, podrías eliminar elementos duplicados y construir una nueva lista:
          //   _options = _options.toSet().toList();
          // }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                dropdownColor: Colors.white,
                icon: const Icon(Icons.arrow_downward),
                elevation: 0,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  border:  OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 165, 165, 165)),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "Name",
                ),
                onChanged: (String? value) {
                  if (widget.type == 'customers') {
                    setState(() {
                      if (value != null) {
                        ref.read(selectedCustomer.notifier).state = value;
                        // print(value);
                        // print("hola");
                        // yourcolor = _getColor(value, yourcolor);
                      }
                    });
                  }
                },
                items: snapshot.data!=null ? snapshot.data!
                    .map((fc) => DropdownMenuItem<String>(
                          value: fc.id.toString(),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              fc.name ?? "sin hornos",
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ))
                    .toList() : null
              ),
            );
          }

          return const CircularProgressIndicator();
        });
  }
}
