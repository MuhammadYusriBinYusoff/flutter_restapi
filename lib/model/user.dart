import 'package:flutter_restapi/model/user_dob.dart';
import 'package:flutter_restapi/model/user_location.dart';
import 'package:flutter_restapi/model/user_name.dart';
import 'package:flutter_restapi/model/user_picture.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final PictureUrl picture;
  final UserDob dob;
  final UserLocation location;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.picture,
    required this.dob,
    required this.location,
  });

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}