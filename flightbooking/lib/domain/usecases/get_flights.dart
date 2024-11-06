import '../../data/models/flight_model.dart';

class GetAvailableFlights {
  List<Flight> call(String origin, String destination) {
    return dummyFlights;
  }
}
