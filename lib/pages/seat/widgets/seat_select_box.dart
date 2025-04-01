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
    return Column(
      children: [
        // A B     C D
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("A",style: TextStyle(fontSize: 18)), SizedBox(width: 40),
              Text("B",style: TextStyle(fontSize: 18)), SizedBox(width: 60), // 간격
              Text("C",style: TextStyle(fontSize: 18)), SizedBox(width: 40),
              Text("D",style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        Column(
          children: List.generate(20, (row) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
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
                    width: 30,
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
        margin: EdgeInsets.symmetric(horizontal: 6),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
