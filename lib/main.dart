import 'package:flutter/material.dart';
import 'record_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecordListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
