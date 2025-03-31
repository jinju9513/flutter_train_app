import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  final String Departure;
  final String Arrival;

  const SeatPage({required this.Departure, required this.Arrival});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    Departure,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    Arrival,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple,
                ),
              ),
              SizedBox(width: 4),
              Text('선택됨'),
              SizedBox(width: 20),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300]!,
                ),
              ),
              SizedBox(width: 4),
              Text('선택됨'),
            ],
          ),
        ],
      ),
    );
  }
}
