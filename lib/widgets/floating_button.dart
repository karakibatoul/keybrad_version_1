import 'package:flutter/material.dart';
import 'package:keybrad/utils/app_theme.dart';

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
          side: const BorderSide(width: 2, color: AppTheme.textOrange),
          borderRadius: BorderRadius.circular(16),
        ),
        child:const  Icon(Icons.add, color: AppTheme.textOrange),
        onPressed: onClicked,
      );
}
}