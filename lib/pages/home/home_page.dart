import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_train_app/pages/home/widgets/select_box.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';
import 'package:flutter_train_app/pages/station/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDeparture;
  String? selectedArrival;

  bool get isButtonEnabled => //get 계산된값을 변수처럼 쓸 수 있게해주는 함수
      selectedDeparture != null && selectedArrival != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  //여기에 넣으세요!!!!!!!!!!!!
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                     onPressed: isButtonEnabled
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SeatPage()),
                            );
                          }//삼항연산자를 사용하여 true면 페이지 이동 아니면 null 버튼 비활성화
                        : null, //ElevatedButton의 onPressed를 null로 주면 버튼이 비활성화 상태로 바뀜 (회색 처리 + 클릭 불가능)
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text('좌석선택'),
                    ),
                  ),
                ],
              ),
            
          ),
        ),
      ),
    );
  }
}
