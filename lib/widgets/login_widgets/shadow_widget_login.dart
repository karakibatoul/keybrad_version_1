import 'package:flutter/material.dart';
import 'package:keybrad/widgets/login_widgets/half_background_widget.dart';
import 'package:keybrad/widgets/login_widgets/log_in_model.dart';

class ShadowWidgetLogin extends StatelessWidget {
  const ShadowWidgetLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        //height: 500,

        // height: double.infinity,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: LayoutBuilder(builder: (context, constraint){
            return  Stack(
              overflow: Overflow.visible,
              children: [


                /* Container(
      decoration: const BoxDecoration(
        color: Colors.white10,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            spreadRadius: 3.0,
            offset: Offset(10.0, 10.0),
          ),
        ],
      ),
      alignment: Alignment.centerRight,
      width: constraint.maxWidth,
      height: constraint.maxHeight,
      child:const RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Container 1',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    ),*/
                Positioned(
                  //  left: -15,
                  //  top: -15,
                  child: Container(
                      decoration:const  BoxDecoration(
                        color: Colors.grey,
                        /*boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    spreadRadius: 3.0,
                    offset: Offset(10.0, 10.0),
                  ),
                ],*/
                      ),
                      // alignment: Alignment.bottomCenter,
                      width: constraint.maxWidth,
                      height: constraint.maxHeight/4,
                      child:const HalfBackgroundWidget()),
                ),

                Positioned(
                  top: (constraint.maxHeight /4) -20
                  ,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            spreadRadius: 10.0,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),

                      alignment: Alignment.center,
                      width: constraint.maxWidth,
                      // height: ((constraint.maxHeight*3)/4)+700,
                      //height: constraint.maxHeight,
                      height: ((MediaQuery.of(context).size.height * 3) / 4) + 20,
                      child:
                      /*TextButton(child: Text('data'),onPressed: (){
            print("hello");
            print(constraint.maxHeight);
            print("hello1");
            print(MediaQuery.of(context).size.height);
          },)*/
                      const LoginModel()
                  ),
                ),
              ],
            );
          }

          ));

  }
}
