import 'package:flutter/material.dart';
import 'package:icon_picker/icon_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IconPicker Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller;
  //String _initialValue;
  String _value = '';

  @override
  void initState() {
    super.initState();

    //_initialValue = 'home';
    _controller = TextEditingController(text: 'home');

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = 'favorite';
        _controller.text = 'favorite';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter IconPicker Demo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          child: Column(
            children: <Widget>[
              IconPicker(
                controller: _controller,
                //initialValue: _initialValue,
                icon: Icon(Icons.apps),
                labelText: "Icon",
                enableSearch: true,
                onChanged: (val) => setState(() => _value = val),
                onSaved: (val) => setState(() => _value = val),
              ),
              SizedBox(height: 30),
              Text(
                'IconPicker data value:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SelectableText(_value),
            ],
          ),
        ),
      ),
    );
  }
}
