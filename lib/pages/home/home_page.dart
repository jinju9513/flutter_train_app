import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              //  버튼 눌렀을때
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
             child: Text('좌석선택')),
          ),
        ),
      )
    );
  }
}