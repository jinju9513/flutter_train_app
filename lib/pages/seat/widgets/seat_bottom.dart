import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatBottom extends StatelessWidget {
  final int? selectedSeatIndex;

  const SeatBottom({required this.selectedSeatIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            int row = (selectedSeatIndex! ~/ 4) + 1;
            int col = selectedSeatIndex! % 4;
            String colLabel = ['A', 'B', 'C', 'D'][col];
            String seatLabel = '$row-$colLabel';

            showCupertinoDialog(
              context: context,
              builder:
                  (context) => CupertinoAlertDialog(
                    title: Text(
                      '예매를 진행할까요?',
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    content: Text(
                      '선택한 좌석: $seatLabel',
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.textTheme.bodyLarge?.color, // 부드러운 회색
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('취소',
                        style: TextStyle(color: Colors.redAccent),),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoDialogAction(
                        child: Text('확인',
                        style: TextStyle(color: Colors.blueAccent),),
                        onPressed: () {
                          Navigator.pop(context); // 다이얼로그 닫기
                          Navigator.pop(context); // SeatPage 닫기
                        },
                      ),
                    ],
                  ),
            );
          },
          child: Text(
            '예매 하기',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
