import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _numberFrom = 0;
  String? _startMeasure;
  String? _endMeasure;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700],
  );

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                SizedBox(height: 20),
                 
                Text(
                  'Value',
                  style: labelStyle,
                ),
                SizedBox(height: 10),

                DropdownButton<String>(
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value;
                    });
                  },
                  value: _startMeasure,
                  hint: Text('Select a Unit'),
                ),

                TextField(
                  style: inputStyle,
                  decoration: InputDecoration(
                    hintText: 'Please insert the measure to be converted',            
                  ),
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
                      setState(() {
                        _numberFrom = rv;
                      });
                    }
                  },
                ),
                SizedBox(height: 20),

                
                SizedBox(height: 20), 
                Text(
                  'From',
                  style: labelStyle,
                ),
                
                SizedBox(height: 10), 

                DropdownButton<String>(
                  isExpanded: true,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value;
                    });
                  },
                  value: _startMeasure,
                ),
                
                
                SizedBox(height: 20), 
                Text(
                  'To',
                  style: labelStyle,
                ),
                
                SizedBox(height: 10), 

                DropdownButton<String>(
                  isExpanded: true,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _endMeasure = value;
                    });
                  },
                  value: _endMeasure,
                ),

                SizedBox(height: 20),

                Text(
                  _numberFrom.toString(),
                  style: inputStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
