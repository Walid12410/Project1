import 'package:flutter/material.dart';

class Speed{
  String Convert;

  Speed(this.Convert);

  @override
  String toString() {
    return 'From $Convert';
  }

}

List<Speed> speeds=[
  Speed('mph To kph'),
  Speed('kph To mph')
];

