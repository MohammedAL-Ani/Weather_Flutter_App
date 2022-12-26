import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String city;
  final String country;
  final String lat;
  final String lon;

  const Location(
      {required this.city,
      required this.country,
      required this.lat,
      required this.lon});

  @override
  List<Object> get props => [city, country, lat, lon];
}
