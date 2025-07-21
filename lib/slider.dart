import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SliderOnlyExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class SliderOnlyExample extends StatefulWidget {
  @override
  _SliderOnlyExampleState createState() => _SliderOnlyExampleState();
}

class _SliderOnlyExampleState extends State<SliderOnlyExample> {
  double sliderValue = 50;
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Widget Example"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Adjust the value',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Current: ${sliderValue.round()}',
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
            SizedBox(height: 8),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 20,
              label: sliderValue.round().toString(),
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.deepPurple[100],
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  resultText = '🎯 Selected value: ${sliderValue.round()}';
                });
              },
              icon: Icon(Icons.check_circle),
              label: Text("Confirm"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 30),
            AnimatedOpacity(
              opacity: resultText.isEmpty ? 0.0 : 1.0,
              duration: Duration(milliseconds: 400),
              child: Text(
                resultText,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
