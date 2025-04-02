import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station/station_list_page.dart';

class SelectBox extends StatefulWidget {
  final Function(String) onDepartureSelected;
  final Function(String) onArrivalSelected;

  const SelectBox({
    Key? key,
    required this.onDepartureSelected,
    required this.onArrivalSelected,
  }) : super(key: key);

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  String? selectedDeparture;
  String? selectedArrival;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: stationSelect(context),
    );
  }

  Widget stationSelect(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => StationListPage(
                      title: '출발역',
                      excludeStation: selectedArrival,
                    ),
              ),
            );

            if (result != null) {
              setState(() {
                selectedDeparture = result;
              });
              widget.onDepartureSelected(result);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('출발역', style: theme.textTheme.bodyMedium),
              Text(
                selectedDeparture ?? '선택',
                style: TextStyle(
                  fontSize: 40,
                  color: theme.textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Container(color: theme.dividerColor, width: 2, height: 50),
        GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => StationListPage(
                      title: '도착역',
                      excludeStation: selectedDeparture,
                    ),
              ),
            );

            if (result != null) {
              setState(() {
                selectedArrival = result;
              });
              widget.onArrivalSelected(result);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('도착역', style: theme.textTheme.bodyMedium),
              Text(
                selectedArrival ?? '선택',
                style: TextStyle(
                  fontSize: 40,
                  color: theme.textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
