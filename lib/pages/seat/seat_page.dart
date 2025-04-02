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
  int? selectedSeatIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('좌석 선택',
      style: TextStyle(
      fontWeight: FontWeight.normal,
      ),
      )),
      body: Container(
        decoration: BoxDecoration(
          color:
              theme.brightness == Brightness.light
                  ? Colors.white
                  : null, // 다크모드는 건드리지 않기
          borderRadius: BorderRadius.circular(20), 
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.Departure,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.arrow_circle_right_outlined, size: 30),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.Arrival,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.primaryColor,
                  ),
                ),
                const SizedBox(width: 4),
                Text('선택됨', style: 
                TextStyle(
                color: theme.textTheme.bodyLarge?.color, // 부드러운 회색
                        fontWeight: FontWeight.normal,),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.dividerColor,
                  ),
                ),
                const SizedBox(width: 4),
                Text('선택안됨', style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color, // 부드러운 회색
                        fontWeight: FontWeight.normal,
                )),
              ],
            ),
            const SizedBox(height: 20),
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
            SeatBottom(selectedSeatIndex: selectedSeatIndex),
          ],
        ),
      ),
    );
  }
}
