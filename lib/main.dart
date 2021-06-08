import 'package:flutter/material.dart';
import 'package:sqlitetopico/pages/home_page.dart';
import 'package:sqlitetopico/providers/BD/db_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      title: 'Topico Avanzado de programacion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   
        primarySwatch: Colors.green,
      ),
      home:HomePage() 
    );
  }
}

