class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreets street;
  final LocationCoordinates coordinates;
  final LocationTimezoneCoordinates timezone;

  UserLocation({
      required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.street,
      required this.coordinates,
      required this.timezone,
  });
}

class LocationStreets{
  final int number;
  final String name;

  LocationStreets({
    required this.number,
    required this.name
  });
}


class LocationCoordinates{
  final String latitude;
  final String longitude;

  LocationCoordinates({
    required this.latitude,
    required this.longitude,
  });
}

class LocationTimezoneCoordinates{
  final String offset;
  final String description;

  LocationTimezoneCoordinates({
    required this.description,
    required this.offset,
  });
}