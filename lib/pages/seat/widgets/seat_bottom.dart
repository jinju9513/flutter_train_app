import 'package:flutter/material.dart';

class SeatBottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
      ), 
      child: Text('예매 하기',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      )),
    );
  }
}