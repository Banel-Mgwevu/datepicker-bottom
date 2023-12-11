import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Picker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DatePickerScreen(),
    );
  }
}

class DatePickerScreen extends StatelessWidget {
  void _showDatePicker(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      // For Android, show Material DatePicker
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.blue, // Header background color
                onPrimary: Colors.white, // Header text color
                surface: Colors.grey, // Background color
                onSurface: Colors.black, // Text color
              ),
              dialogBackgroundColor: Colors.white, // Calendar background color
            ),
            child: child!,
          );
        },
      );
    } else {
      // For iOS, show Cupertino DatePicker
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.white, // Background color
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(1900),
              maximumDate: DateTime(2100),
              onDateTimeChanged: (DateTime dateTime) {
                // Handle date selection
                print(dateTime);
              },
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showDatePicker(context),
          child: Text('Select Date'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Button background color
            onPrimary: Colors.white, // Button text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Button border radius
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Button padding
          ),
        ),
      ),
    );
  }
}
