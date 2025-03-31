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
        return GestureDetector(
          onTap: () {
              print('${stations[index]} 선택됨');
              Navigator.pop(context,stations[index]); //이전 페이지로 인덱스값 전달
            },
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50,
            decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300]!,
              ),
            ),
            ),
            child: ListTile(
              title: Text(stations[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
            ),
          ),
          );
      }),
    
   );
  }
}