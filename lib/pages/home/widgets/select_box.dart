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
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
     child:  stationSelect(context),
    );
  }

  Widget stationSelect(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: ()async{
            final result = await Navigator.push(context, 
                        MaterialPageRoute(builder: (context) =>StationListPage(title : '출발역')));

                        if(result !=null){
                          setState(() {
                            selectedDeparture = result; // 선택한 출발역 저장
                          });
                          widget.onDepartureSelected(result);
                        }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '출발역',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(selectedDeparture ?? '선택', style: TextStyle(fontSize: 40)), //값이 null이면 선택 아니면 선택한 역 보여주기
            ],
          ),
        ),
        Container(color: Colors.grey[400], width: 2, height: 50),
        GestureDetector(
           onTap: ()async{
            final result = await Navigator.push(context, 
                        MaterialPageRoute(builder: (context) =>StationListPage(title : '도착역')));

                        if(result !=null){
                          setState(() {
                            selectedArrival = result; // 선택한 도착역 저장
                          });
                          widget.onArrivalSelected(result);
                        }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '도착역',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(selectedArrival ?? '선택', style: TextStyle(fontSize: 40)), //값이 null이면 선택 아니면 선택한 역 보여주기
            ],
          ),
        ),
      ],
    );
  }
}
