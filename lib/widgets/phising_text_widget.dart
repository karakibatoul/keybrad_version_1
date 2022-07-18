import 'package:flutter/material.dart';

class PhishingTextWidget extends StatefulWidget {

  final String text;


    const PhishingTextWidget({Key? key,
    required this.text,
  }) : super(key: key) ;

  @override
  State<PhishingTextWidget> createState() => _PhishingTextWidgetState();
}

class _PhishingTextWidgetState extends State<PhishingTextWidget> {

  TextStyle style = const TextStyle(fontSize: 20,overflow: TextOverflow.visible,);
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,style: style,);
  }
}
