class Flight {
  final String airline;
  final String departureTime;
  final String arrivalTime;
  final String origin;
  final String destination;
  final double price;

  Flight({
    required this.airline,
    required this.departureTime,
    required this.arrivalTime,
    required this.origin,
    required this.destination,
    required this.price,
  });
}

List<Flight> dummyFlights = [
  Flight(
    airline: "Garuda Indonesia",
    departureTime: "14:35",
    arrivalTime: "21:55",
    origin: "BLR",
    destination: "CHI",
    price: 1409.0,
  ),
  Flight(
    airline: "Garuda Indonesia",
    departureTime: "21:55",
    arrivalTime: "14:35",
    origin: "BLR",
    destination: "CHI",
    price: 1359.0,
  ),
];