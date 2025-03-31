import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget{
  final String title;
  final List<String> stations = ["수서","동탄","평택지제","천안아산","오송","대전","김천구미","동대구","경주","울산","부산"];

  StationListPage({required this.title});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: ListView.builder(
      itemCount: stations.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(stations[index]),
          onTap: () {
            print('${stations[index]} 선택됨');
          },
        );
      }),
    
   );
  }
}