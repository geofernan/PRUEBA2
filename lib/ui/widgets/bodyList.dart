import 'package:flutter/material.dart';
import '../themes/theme_data.dart';
import '../utils/icono_string_util.dart';

Widget titleSection(name, nameIcon) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      gradient: LinearGradient(
        colors: [
          AppThemeData.blueMattsa,
          AppThemeData.grayMattsaLight,
          AppThemeData.blueMattsa,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Card(
      color: Colors
          .transparent, //Tranparentar la card para tomar el color del container
      elevation: 10, // La sombra que tiene el Card aumentará
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        leading: getIcon(nameIcon, Colors.white, 20),
      ),
    ),
  );
}

Widget buttonNext(name, nameIcon, context, route) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      gradient: LinearGradient(
        colors: [
          AppThemeData.blueMattsa,
          AppThemeData.grayMattsaLight,
          AppThemeData.blueMattsa,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        color: Colors
            .transparent, //Tranparentar la card para tomar el color del container
        elevation: 10, // La sombra que tiene el Card aumentará
        child: ListTile(
          title: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
          leading: getIcon(nameIcon, Colors.white, 20),
        ),
      ),
    ),
  );
}

Widget listItems(name, company, nameIcon, context, route) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: AppThemeData.grayMattsa,
          blurRadius: 4.0, // soften the shadow
          spreadRadius: 1.0, //extend the shadow
          offset: Offset(
            1.0, // Move to right 5  horizontally
            1.0, // Move to bottom 5 Vertically
          ),
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: ListTile(
      title: Text(name, style: TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(company),
      trailing: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppThemeData.blueMattsa),
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        child: getIcon(nameIcon, Colors.white, 15),
      ),
    ),
  );
}

Widget custombody(name, nameIcon) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppThemeData.grayMattsa,
            blurRadius: 4.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              1.0, // Move to right 5  horizontally
              1.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("hola"),
              Divider(),
              Text("como"),
              Divider(),
              Text("bien")
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0)),
          Row(
            children: [
              Text("hola"),
              Divider(),
              Text("como"),
              Divider(),
              Text("bien")
            ],
          )
        ],
      ));
}

Widget subSection(name, nameIcon, Color col, String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: col),
      child: Card(
        semanticContainer: false,
        color: Colors
            .transparent, //Tranparentar la card para tomar el color del container
        elevation: 10, // La sombra que tiene el Card aumentará
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
