import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.menu,
  'accessibility': Icons.home_repair_service,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'list': Icons.list,
  'tune': Icons.tune,
  'lock': Icons.lock,
  'key': Icons.key,
  'email': Icons.email,
  'alter_email': Icons.alternate_email,
  'work': Icons.work_history_sharp,
  'eye': Icons.remove_red_eye,
  'calendar': Icons.calendar_month_sharp,
  'calendar': Icons.calendar_month_sharp,
  'eye_off': Icons.visibility_off,
};

Icon getIcon(String nombreIcono, colorIcon, double sizeIcon) {
  return Icon(
    _icons[nombreIcono],
    color: colorIcon,
    size: sizeIcon,
  );
}
