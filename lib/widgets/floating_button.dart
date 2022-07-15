import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final int tag;

  const FloatingButtonWidget({
    Key? key,
    required this.onClicked, required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return FloatingActionButton(
      heroTag:tag ,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Theme
              .of(context)
              .accentColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(Icons.add, color: Theme
            .of(context)
            .accentColor),
        onPressed: onClicked,
      );
}
}