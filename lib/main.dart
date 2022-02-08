import 'package:flutter/material.dart';
import 'package:peticiones_http/pages/home.dart';
import 'package:peticiones_http/services/user_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}