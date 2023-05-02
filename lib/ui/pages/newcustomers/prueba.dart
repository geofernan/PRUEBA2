import 'package:flutter/material.dart';

import '../../../domain/models/customer/customer.dart';

class DropdownButtonExample extends StatefulWidget {
  final List<Customer> listade = [];

   DropdownButtonExample({super.key, required List<Customer> listade});



  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  @override
   Widget build(BuildContext context) {
     
    return DropdownButton<String>(
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
         
        });
      },
      items: widget.listade.map((fc) => DropdownMenuItem<String>(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              fc.name,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          value: fc.id.toString(),
                        ))
                    .toList(),
    );
  }
}
