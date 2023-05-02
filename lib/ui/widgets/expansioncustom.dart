import 'package:flutter/material.dart';
import '../utils/clases.dart';
import 'expansion.dart';

class ExpansionCustom extends StatefulWidget {
  final Color _colorwords;
  final Color _color;
  final Widget _bodywidget;
  final List<Item> _listitems;

  ExpansionCustom({
    required Color colorwords,
    required Color color,
    required List<Item> listitems,
    required Widget bodywidget,
  })  : _colorwords = colorwords,
        _color = color,
        _bodywidget = bodywidget,
        _listitems = listitems;

  @override
  State<ExpansionCustom> createState() => _ExpansionCustomState();
}

class _ExpansionCustomState extends State<ExpansionCustom> {
  @override
  Widget build(BuildContext context) {
    return CustomExpansionPanelList(
      color: widget._color,
      paddingVertical: 5,
      radioBox: 20,
      radioBigBox: 10,
      expansionCallback: (int index, bool isexpanded) {
        setState(() {
          widget._listitems[index].isExpanded = !isexpanded;
        });
      },
      children: widget._listitems.map<ExpansionPanel>((Item ite) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                child: ListTile(
                  title: Text(
                    ite.title,
                    style: TextStyle(color: widget._colorwords),
                  ),
                ),
              );
            },
            body: widget._bodywidget,
            isExpanded: ite.isExpanded);
      }).toList(),
    );
  }
}
