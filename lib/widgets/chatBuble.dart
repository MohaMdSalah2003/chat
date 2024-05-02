import 'package:flutter/material.dart';

import '../Model/message.dart';
import '../constants.dart';
class chatBuble extends StatelessWidget {
  const chatBuble({
    Key? key,
    required this.message
  }) : super(key: key);
  final  Message message;
  @override
  Widget build(BuildContext context) {
    return Align
  (
    alignment: Alignment.centerLeft,
      child: Container(
        
        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: EdgeInsets.all(16),
        
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)
            ), color: kPrimaryColor),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}