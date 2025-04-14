import 'package:flutter/material.dart';
import 'change_color.dart';
void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
       title: 'Color Changer',
      home: ChangeColor(),
        
    );
  }
}
