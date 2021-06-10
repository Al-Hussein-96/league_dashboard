import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  double val = 0;
  String dropdownValue = 'One';

  void change() {
    setState(() {
      val += 1;
    });
  }

  Widget build(BuildContext context) {
    DropdownMenuItem<String> item1 = DropdownMenuItem(child: Text('Hello'));
    DropdownMenuItem item2 = DropdownMenuItem(child: Text('world'));
    DropdownMenuItem item3 = DropdownMenuItem(child: Text('english'));
    DropdownMenuItem item4 = DropdownMenuItem(child: Text('arabic'));

    return Scaffold(
      appBar: AppBar(),
      body:
      Center(
          child: DropdownButton<String>(
            onChanged: (value) {
              setState(() {
                print('on Change');
                print(value);
                dropdownValue = value!;
              });
            },
        items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: dropdownValue,


      ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          child: Counter(),
        ),
      ),
    );
  }
}

Future<void> main() async {
  runApp(MyApp());
}
