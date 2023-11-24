import 'package:flutter/material.dart';


class Area{
  double metersToFeet(double meters) {
    return meters * 3.28084;
  }
  double feetToMeters(double feet) {
    return feet / 3.28084;
  }

  double squareMetersToAcres(double squareMeters) {
    return squareMeters * 0.000247105;
  }

  double acresToSquareMeters(double acres) {
    return acres * 4046.86;
  }
}