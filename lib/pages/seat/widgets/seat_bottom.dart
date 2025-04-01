import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatBottom extends StatelessWidget {
  final int? selectedSeatIndex;

  const SeatBottom({required this.selectedSeatIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            if (selectedSeatIndex == null) {
              return;
            }
            // 선택된 좌석 번호 계산
            int row = (selectedSeatIndex! ~/ 4) + 1; // 0~9 => 1~10
            int col = selectedSeatIndex! % 4;
            String colLabel = ['A', 'B', 'C', 'D'][col]; //배역에서 꺼내기
            String seatLabel = '$row-$colLabel';

            showCupertinoDialog(
              context: context,
              builder:
                  (context) => CupertinoAlertDialog(
                    title: Text('예매를 진행할까요?'),
                    content: Text('선택한 좌석:$seatLabel'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('취소'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoDialogAction(
                        child: Text('확인'),
                        onPressed: () {
                          Navigator.pop(context); //다이얼로그 닫기
                          Navigator.pop(context); //SeatPage 닫기
                          Navigator.pop(context); //HomePage 돌아가기
                        },
                      ),
                    ],
                  ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            '예매 하기',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
