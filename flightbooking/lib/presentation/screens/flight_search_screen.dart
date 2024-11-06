import 'package:flutter/material.dart';
import 'flight_results_screen.dart';

class FlightSearchScreen extends StatefulWidget {
  @override
  _FlightSearchScreenState createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  int selectedTripType = 0; // 0: Round Trip, 1: One Way, 2: Multi-city
  DateTime selectedDepartureDate = DateTime.now();
  DateTime? selectedReturnDate;
  String selectedTravelers = "1 Passenger";
  String selectedCabinClass = "Economy Class";
  
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _returnController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _departureController.text = _formatDate(selectedDepartureDate);
    _returnController.text = selectedReturnDate != null ? _formatDate(selectedReturnDate!) : '';
  }

  @override
  void dispose() {
    _departureController.dispose();
    _returnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            Text("Search Flights"),
          ],
        ),
        backgroundColor: Colors.green[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'images/Mask group.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        "Let's start your trip",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black45,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTripTypeTab("Round Trip", 0),
                            _buildTripTypeTab("One Way", 1),
                            _buildTripTypeTab("Multi-city", 2),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'From',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.flight, color: Colors.green),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  CircleAvatar(
                    backgroundColor: Colors.green[50],
                    radius: 16,
                    child: const Icon(
                      Icons.swap_vert,
                      color: Colors.green,
                      size: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'To',
                      prefixIcon: Icon(Icons.location_pin, color: Colors.green),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _departureController,
                      readOnly: true,
                      onTap: () => _selectDate(context, isDeparture: true),
                      decoration: const InputDecoration(
                        labelText: 'Departure',
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _returnController,
                      readOnly: true,
                      onTap: () => _selectDate(context, isDeparture: false),
                      decoration: const InputDecoration(
                        labelText: 'Return',
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedTravelers,
                      items: ["1 Passenger", "2 Passengers", "3 Passengers"]
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedTravelers = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Travelers',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedCabinClass,
                      items: ["Economy Class", "Business Class", "First Class"]
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCabinClass = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Cabin Class',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlightResultsScreen()),
                    );
                  },
                  child: const Text('Search Flights'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripTypeTab(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTripType = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: selectedTripType == index ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selectedTripType == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, {required bool isDeparture}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDeparture ? selectedDepartureDate : (selectedReturnDate ?? selectedDepartureDate),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          selectedDepartureDate = picked;
          _departureController.text = _formatDate(selectedDepartureDate);
        } else {
          selectedReturnDate = picked;
          _returnController.text = _formatDate(selectedReturnDate!);
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
