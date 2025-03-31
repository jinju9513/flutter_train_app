import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget{
  final String title;

  StationListPage({required this.title});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    
   );
  }
}