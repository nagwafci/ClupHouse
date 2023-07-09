import 'package:flutter/material.dart';
import 'package:clup_house/models/User.dart';
class Room{
final String club;
final String name;
final List<User> speakers;
final List<User> followedBySpeakers;
final List<User> others;

 Room({
  required this.club,
  required this.name,
  this.speakers = const [],
  this.followedBySpeakers = const [],
  this.others = const [],
});
}