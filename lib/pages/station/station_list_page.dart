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
    final theme = Theme.of(context);

    final List<String> filteredStations =
        excludeStation == null
            ? stations
            : stations.where((station) => station != excludeStation).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.normal)),
      ),
      body: Container(
         decoration: BoxDecoration(
          color:
              theme.brightness == Brightness.light
                  ? Colors.white
                  : null, // 다크모드는 건드리지 않기
          borderRadius: BorderRadius.circular(20), 
        ),
        child: ListView.builder(
          itemCount: filteredStations.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, filteredStations[index]);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: theme.dividerColor)),
                ),
                child: ListTile(
                  title: Text(
                    filteredStations[index],
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
