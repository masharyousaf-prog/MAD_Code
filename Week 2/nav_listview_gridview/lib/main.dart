import 'package:flutter/material.dart';

import 'list_view_widget.dart';
import 'grid_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation with listview and gridview',
      initialRoute: '/',
      routes: {
        '/': (context) => const ListViewEWidget(),
        '/grid': (context) => const GridViewWidget(),
      },
    );
  }
}
