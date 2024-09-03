import 'package:flutter_restapi/model/user.dart';
import 'package:flutter_restapi/model/user_dob.dart';
import 'package:flutter_restapi/model/user_location.dart';
import 'package:flutter_restapi/model/user_name.dart';
import 'package:flutter_restapi/model/user_picture.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserAPI{
   static Future<List<User>> fetchUsers() async {
    print('fetchUsersss');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(title: e['name']['title'], first: e['name']['first'], last: e['name']['last']);
      final pic = PictureUrl(large: e['picture']['large'], medium: e['picture']['medium'], thumbnail: e['picture']['thumbnail']);
      final date = e['dob']['date'];
      final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);
      final coordinates = LocationCoordinates(latitude: e['location']['coordinates']['latitude'], longitude: e['location']['coordinates']['longitude']);
      final streets = LocationStreets(number: e['location']['street']['number'], name: e['location']['street']['name']);
      final timezones = LocationTimezoneCoordinates(description: e['location']['timezone']['description'], offset: e['location']['timezone']['offset']);
      final location = UserLocation(city: e['location']['city'], state: e['location']['state'], country: e['location']['country'], postcode: e['location']['postcode'].toString(), street: streets, coordinates: coordinates, timezone: timezones);
      return User(
        cell: e['cell'],
        email:e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        picture: pic,
        dob: dob,
       location: location
      );
    }).toList();
    // setState(() {
    //   users = transformed;
    // });
    return transformed;
    //print('fetchUsers completed');
  }
}