import 'package:flutter/material.dart';

import '../model/travel_inspiration_model.dart';
import '../utils/images.dart';
import 'ezy_travel_screen.dart';

class SearchFlightScreen extends StatefulWidget {
  const SearchFlightScreen({super.key});

  @override
  State<SearchFlightScreen> createState() => _SearchFlightScreenState();
}

class _SearchFlightScreenState extends State<SearchFlightScreen> {
  String tabBtnValue = 'Round Trip';
  DateTime? departDate;
  DateTime? returnDate;
  String? selectedPassengers = '1 Passenger';
  String? selectedCabinClass = 'Economy';

  final List<String> passengerOptions = [
    '1 Passenger',
    '2 Passengers',
    '3 Passengers',
    '4 Passengers'
  ];
  final List<String> cabinClassOptions = ['Economy', 'Business', 'First Class'];
  TextEditingController sourceController = TextEditingController();
  TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade200,
          leading: const Icon(Icons.arrow_back),
          title: const Text('Search Flight'),
          actions: const [
            Icon(Icons.menu),
            SizedBox(width: 5),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(Images.banner),
                          const Positioned(
                            left: 15,
                            top: 10,
                            child: Text(
                              'Let\'s start your trip',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      tripDetails(),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tabBtnValue = 'Round Trip';
                                });
                              },
                              child: tripTitle(
                                'Round Trip',
                                tabBtnValue == 'Round Trip'
                                    ? Colors.green
                                    : Colors.white,
                                tabBtnValue == 'Round Trip'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tabBtnValue = 'One Way';
                                });
                              },
                              child: tripTitle(
                                'One Way',
                                tabBtnValue == 'One Way'
                                    ? Colors.green
                                    : Colors.white,
                                tabBtnValue == 'One Way'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tabBtnValue = 'Multi-city';
                                });
                              },
                              child: tripTitle(
                                'Multi-city',
                                tabBtnValue == 'Multi-city'
                                    ? Colors.green
                                    : Colors.white,
                                tabBtnValue == 'Multi-city'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tripDetails() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 2,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'From',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              prefixIcon: Icon(
                                Icons.flight,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Container(
                            height: 2,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.green, Colors.white],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'To',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Image.asset(
                      Images.swapIcon,
                      scale: 3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: dateField(
                      'Departure',
                      departDate != null
                          ? "${departDate!.day}/${departDate!.month}/${departDate!.year}"
                          : 'Select Date',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                if (tabBtnValue == 'Round Trip')
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: dateField(
                        'Return',
                        returnDate != null
                            ? "${returnDate!.day}/${returnDate!.month}/${returnDate!.year}"
                            : 'Select Date',
                        isEnabled: tabBtnValue == 'Round Trip',
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: dropdownField(
                    'Travellers',
                    selectedPassengers!,
                    passengerOptions,
                    (String? value) {
                      setState(() {
                        selectedPassengers = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: dropdownField(
                    'Cabin Class',
                    selectedCabinClass!,
                    cabinClassOptions,
                    (String? value) {
                      setState(() {
                        selectedCabinClass = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EzyTravelScreen(tripType: tabBtnValue),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Search Flights',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(height: 320, child: travelInspirationCard()),
            const SizedBox(height: 10),
            flightAndHotelPackages()
          ],
        ),
      ),
    );
  }

  Widget dateField(String title, String date, {bool isEnabled = true}) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: Icon(Icons.calendar_month_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      ),
      child: Text(
        date,
        style: TextStyle(
            fontSize: 16, color: isEnabled ? Colors.black : Colors.grey),
      ),
    );
  }

  Widget dropdownField(String title, String selectedValue, List<String> options,
      ValueChanged<String?> onChanged) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          icon: const SizedBox.shrink(),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  Widget tripTitle(String title, Color color, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(title, style: TextStyle(fontSize: 16, color: textColor)),
    );
  }

  Widget travelInspirationCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Travel Inspiration',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: travelInspirations.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                height: 260,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      travelInspirations[index].imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              travelInspirations[index].flightName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 4), // Reduced spacing
                            Text(
                              travelInspirations[index].classType,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 4), // Reduced spacing
                            Text(
                              travelInspirations[index].country,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget flightAndHotelPackages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flight & Hotel Packages',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage(Images.hotelPackage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
