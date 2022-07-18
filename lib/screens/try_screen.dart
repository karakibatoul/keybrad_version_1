
import 'package:flutter/material.dart';

class TryScreen extends StatefulWidget {
   const TryScreen({Key? key}) : super(key: key);
   static const routeName = '/try_screen';

  @override
  State<TryScreen> createState() => _TryScreenState();
}

class _TryScreenState extends State<TryScreen> {
  int _counter = 0;
  double _starValue = 10;
  double _endValue = 80;
  double minValue = 0.0;
  double maxValue = 100.0;

  final startController = TextEditingController();
  final endController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    startController.addListener(_setStartValue);
    endController.addListener(_setEndValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  _setStartValue() {
    if (double.parse(startController.text).roundToDouble() <=
        double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _starValue = double.parse(startController.text).roundToDouble();
      });
    }

  }

  _setEndValue() {
    if (double.parse(startController.text).roundToDouble() <=
        double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _endValue = double.parse(endController.text).roundToDouble();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin:const  EdgeInsets.all(20),
              child: TextField(
                
                decoration:const  InputDecoration(
                    border: InputBorder.none, hintText: 'Enter  start value'),
                controller: startController,
              ),
            ),
            Container(
              margin:const EdgeInsets.all(20),
              child: TextField(
              decoration:const  InputDecoration(
                  border: InputBorder.none, hintText: 'Enter end value'),
              controller: endController,
            ),),

            RangeSlider(
              values: RangeValues(_starValue, _endValue),
              min: minValue,
              max: maxValue,
              onChanged: (values) {
                setState(() {
                  _starValue = values.start.roundToDouble();
                  _endValue = values.end.roundToDouble();
                  startController.text =
                      values.start.roundToDouble().toString();
                  endController.text = values.end.roundToDouble().toString();
                });
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:const  Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}