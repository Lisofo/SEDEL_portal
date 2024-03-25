import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'credit_score': Icons.credit_score,
  'corporate_fare_rounded': Icons.corporate_fare_rounded,
  'my_library_books_rounded': Icons.my_library_books_rounded,
  'dashboard': Icons.dashboard,
  'dashboard_customize_outlined': Icons.dashboard_customize_outlined,
  'person': Icons.person,
  'propane_tank_sharp': Icons.propane_tank_sharp,
  'chrome_reader_mode': Icons.chrome_reader_mode,
  'content_paste_outlined': Icons.content_paste_outlined,
};

Icon getIcon(String iconName) {
  return Icon(
    _icons[iconName],
    color: Colors.white,
  );
}
