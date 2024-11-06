import 'package:flutter/material.dart';
import 'presentation/screens/flight_search_screen.dart';

void main() {
  runApp(FlightBookingApp());
}

class FlightBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Booking',
      theme: ThemeData(primarySwatch: Colors.green),
      home: FlightSearchScreen(),
    );
  }
}





