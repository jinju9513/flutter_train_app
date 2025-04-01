import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final List<String> stations = [
    "수서",
    "동탄",
    "평택지제",
    "천안아산",
    "오송",
    "대전",
    "김천구미",
    "동대구",
    "경주",
    "울산",
    "부산",
  ];
  final String? excludeStation;

  StationListPage({required this.title, required this.excludeStation});

  @override
  Widget build(BuildContext context) {
    final List<String> filteredStations =
        excludeStation == null
            ? stations
            : stations.where((station) => station != excludeStation).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('${filteredStations[index]} 선택됨');
              Navigator.pop(context, filteredStations[index]); //이전 페이지로 인덱스값 전달
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: 50,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: ListTile(
                title: Text(
                  filteredStations[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
