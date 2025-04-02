import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/select_box.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDeparture;
  String? selectedArrival;

  bool get isButtonEnabled =>
      selectedDeparture != null && selectedArrival != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차 예매',
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
        ), // AppBarTheme에 스타일 위임
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectBox(
                onDepartureSelected: (value) {
                  setState(() {
                    selectedDeparture = value;
                  });
                },
                onArrivalSelected: (value) {
                  setState(() {
                    selectedArrival = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeatPage(
                                Departure: selectedDeparture!,
                                Arrival: selectedArrival!,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: const Text('좌석선택'), // 버튼 스타일도 테마에 맞춰 자동적용
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
