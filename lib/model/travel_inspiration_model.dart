import '../utils/images.dart';

class TravelInspiration {
  final String flightName;
  final String classType;
  final String country;
  final String imagePath;

  TravelInspiration({
    required this.flightName,
    required this.classType,
    required this.country,
    required this.imagePath,
  });
}

List<TravelInspiration> travelInspirations = [
  TravelInspiration(
      flightName: "From AED867",
      classType: "Economy round trip",
      country: "Saudi Arabia",
      imagePath: Images.saudi),
  TravelInspiration(
      flightName: "From AED867",
      classType: "Economy round trip",
      country: "Kuwait",
      imagePath: Images.kuwait),
  TravelInspiration(
      flightName: "From AED867",
      classType: "Economy round trip",
      country: "Saudi",
      imagePath: Images.saudi),
];
