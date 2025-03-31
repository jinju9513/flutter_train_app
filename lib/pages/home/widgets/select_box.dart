import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station/station_list_page.dart';

class SelectBox extends StatelessWidget {
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
          onTap: (){
            Navigator.push(context, 
                        MaterialPageRoute(builder: (context) =>StationListPage(title : '출발역')));
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
              Text('선택', style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
        Container(color: Colors.grey[400], width: 2, height: 50),
        GestureDetector(
           onTap: (){
            Navigator.push(context, 
                        MaterialPageRoute(builder: (context) =>StationListPage(title: '도착역',)));
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
              Text('선택', style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
      ],
    );
  }
}
