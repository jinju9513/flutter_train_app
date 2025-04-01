import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_bottom.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_select_box.dart';

class SeatPage extends StatefulWidget {
  final String Departure;
  final String Arrival;

  const SeatPage({required this.Departure, required this.Arrival});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedSeatIndex; // 몇번 좌석이 선택됬는지 저장
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
                    widget.Departure,
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
                    widget.Arrival,
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
              Text('선택안됨'),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: SeatSelectBox(
                selectedIndex: selectedSeatIndex,
                onSeatSelected: (index) {
                  setState(() {
                    selectedSeatIndex = index;
                  });
                },
              ),
            ),
          ),
          SeatBottom(selectedSeatIndex: selectedSeatIndex)
        ],
      ),
    );
  }
}
