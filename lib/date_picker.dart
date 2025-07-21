import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Optional: for better formatting

void main() {
  runApp(MaterialApp(
    home: DatePickerExample(),
    debugShowCheckedModeBanner: false,
  ));
}

class DatePickerExample extends StatefulWidget {
  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? selectedDate;

  // Show the date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Clear the selected date
  void _clearDate() {
    setState(() {
      selectedDate = null;
    });
  }

  // Format the date as YYYY-MM-DD (or use intl for custom format)
  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker with Clear"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Select Date Button
              ElevatedButton.icon(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.calendar_today),
                label: Text("Select Date"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              SizedBox(height: 12),

              // Clear Date Button
              ElevatedButton.icon(
                onPressed: _clearDate,
                icon: Icon(Icons.clear),
                label: Text("Clear Date"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              SizedBox(height: 24),

              // Display selected date
              Text(
                selectedDate == null
                    ? '🗓️ No date selected'
                    : '✅ Selected Date: ${_formatDate(selectedDate!)}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal[800],
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
