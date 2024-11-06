import 'package:flightbooking/presentation/screens/flight_details_screen.dart';
import 'package:flutter/material.dart';
import '../../data/models/flight_model.dart';

class FlightResultsScreen extends StatelessWidget {
  final List<Flight> flights = dummyFlights; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Ezy Travel"),
       backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
         Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "BLR - Bengaluru to  CHI- Chennai",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Departure: Wed, 11 Nov - Return: Wed, 11 Nov",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("(Round Trip)", style: TextStyle(color: Colors.orange)),
                    TextButton(
                      onPressed: () {},
                      child:const Text("Modify Search"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  label:const Text("Sort"),
                  icon:const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                  },
                ),
                TextButton.icon(
                  label:const Text("Non-stop"), 
                  onPressed: () {
                  },
                ),
                TextButton.icon(
                  label:const Text("Filter"),
                  icon:const  Icon(Icons.tune),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Mar 24 - Mar 25', style: TextStyle(fontSize: 14)),
                      Text('From AED 741', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                Chip(
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Mar 25 - Mar 26', style: TextStyle(fontSize: 14)),
                      Text('From AED 721', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                Chip(
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Mar 26 - Mar 27', style: TextStyle(fontSize: 14)),
                      Text('From AED 750', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, 
                children: [
                  Text(
                    "    851 Flights Found",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(), 
                    itemCount: flights.length,
                    itemBuilder: (context, index) {
                      final flight = flights[index];
                      return FlightCard(flight: flight);
                    },
                  ),
                  const Divider(), // Add a divider to separate the sections if desired
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
                    itemCount: flights.length,
                    itemBuilder: (context, index) {
                      final flight = flights[index];
                      return FlightCard(flight: flight);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
    final Flight flight;

  const FlightCard({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Onward - ${flight.airline}',
                  style:const  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'AED ${flight.price.toStringAsFixed(2)}',
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
                ),
              ],
            ),
           const SizedBox(height: 8),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('------- ', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Transform.rotate(
                  angle: 30.0, // Tilt the icon if desired
                  child: const Icon(Icons.flight, color: Colors.blue),
                ),
                const Text(' -------', style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
           const SizedBox(height: 4),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                Text('${flight.origin} - Bengaluru'),
                const Text('4h 30m'), 
                Text('${flight.destination} - Chennai'),
              ],
            ),
           const Divider(),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Return - ${flight.airline}',
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'AED ${flight.price.toStringAsFixed(2)}',
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('------- ', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Transform.rotate(
                  angle: 30.0, // Tilt the icon if desired
                  child: const Icon(Icons.flight, color: Colors.blue),
                ),
                const Text(' -------', style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
           const  SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${flight.destination} - Chennai'),
                const Text('4h 30m'),
                Text('${flight.origin} - Bengaluru'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child:const Text('Cheapest', style: TextStyle(color: Colors.green)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child:const Text('Refundable', style: TextStyle(color: Colors.blue)),
                ),
                TextButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlightDetailsScreen(flight: flight),
                      ),
                    );
                  },
                  child:const Text('Flight Details >', style: TextStyle(color: Colors.orange)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}