import 'package:flutter/material.dart';

class PhisingTextWidget extends StatefulWidget {

  final String text;


   PhisingTextWidget({
    required this.text,
  }) ;

  @override
  State<PhisingTextWidget> createState() => _PhisingTextWidgetState();
}

class _PhisingTextWidgetState extends State<PhisingTextWidget> {

  TextStyle style = TextStyle(fontSize: 20,overflow: TextOverflow.visible,);
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,style: style,);
  }
}
