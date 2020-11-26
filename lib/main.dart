import 'package:flutter/material.dart';
import 'drawer.dart';
import 'constants.dart';
import 'dataCalculation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcutor',
      theme: ThemeData.dark().copyWith(
        backgroundColor: Color(0XFF373737),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Data data = Data();
  String numValue = "";

  Expanded button({String value, String border = 'rect'}) {
    if (border == 'circle') {
      return Expanded(
        child: FlatButton(
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: kSpecialButtonStyle,
          ),
          shape: CircleBorder(),
          color: kSpecialButtonColor,
          onPressed: () {
            setState(() {
              print('Pressed! $value');
              input += value;

              print("Value = $value");
              data.addData(numValue);
              input = data.calc().toString();
              numValue = "";
              print('Input : $input');
            });
          },
        ),
      );
    } else {
      return Expanded(
        child: FlatButton(
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: kButtonStyle,
          ),
          onPressed: () {
            setState(() {
              {
                print("Value is now : $value");
                if (value == '+' ||
                    value == '-' ||
                    value == 'X' ||
                    value == '/') {
                  print("Value +- $numValue");
                  data.addData(numValue);
                  data.addData(value);
                  input += value;
                  numValue = "";
                } else if (value == 'C') {
                  input = "";
                  numValue = "";
                  data.clearData();
                } else {
                  print("Value$value");
                  numValue += value;
                  print(numValue);
                  input += value;
                }
              }
            });
          },
        ),
      );
    }
  }

  String fillValue() {
    if (input != "") {
      return input;
    } else {
      return "  ";
    }
  }

  String input = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: DrawerView(),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    fillValue(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  button(value: 'C'),
                  button(value: '()'),
                  button(value: '%'),
                  button(value: '/'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  button(value: '1'),
                  button(value: '2'),
                  button(value: '3'),
                  button(value: 'X'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  button(value: '4'),
                  button(value: '5'),
                  button(value: '6'),
                  button(value: '-'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  button(value: '7'),
                  button(value: '8'),
                  button(value: '9'),
                  button(value: '+'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  button(value: '00'),
                  button(value: '0'),
                  button(value: '.'),
                  button(value: '=', border: 'circle'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
