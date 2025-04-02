import 'package:flutter/material.dart';

class SeatSelectBox extends StatefulWidget {
  final int? selectedIndex; // 선택된 좌석 번호
  final Function(int) onSeatSelected; // 선택되어있을 때 부모에게 알림

  const SeatSelectBox({
    required this.selectedIndex,
    required this.onSeatSelected,
    super.key,
  });

  @override
  State<SeatSelectBox> createState() => _SeatSelectBoxState();
}

class _SeatSelectBoxState extends State<SeatSelectBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // A B     C D
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    "A",
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    "B",
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(width: 50),
            ), // 가운데 번호 간격용

            SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: Text(
                  "C",
                  style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    "D",
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        Column(
          children: List.generate(20, (row) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 왼쪽 2칸
                  ...List.generate(2, (col) {
                    int index = row * 4 + col;
                    return _seatBox(index);
                  }),

                  // 건중에 수정 작업 (row+1)
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Text('${row + 1}'),
                  ),

                  // 오른쪽 2칸
                  ...List.generate(2, (col) {
                    int index = row * 4 + 2 + col;
                    return _seatBox(index);
                  }),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _seatBox(int index) {
    bool isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () => widget.onSeatSelected(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.purple
                  : Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[700]
                  : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
