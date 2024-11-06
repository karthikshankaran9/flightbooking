import 'package:flutter/material.dart';
import '../../data/models/flight_model.dart';

class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;

  FlightDetailsScreen({required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Flight Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Airline: ${flight.airline}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('From: ${flight.origin} - To: ${flight.destination}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Departure: ${flight.departureTime}', style:const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Arrival: ${flight.arrivalTime}', style:const  TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Price: ${flight.price} AED', style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child:const Text('Book Flight'),
            ),
          ],
        ),
      ),
    );
  }
}
