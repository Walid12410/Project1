import 'package:flutter/material.dart';

class Power{
  double WattToKiloWatt(double powerwatt) {
    return double.parse((powerwatt / 1000).toStringAsFixed(4));
  }
  double KiloToWatt(double powerkilowatt) {
    return double.parse((powerkilowatt * 1000).toStringAsFixed(4));
  }

  double WattToHorsepower(double powerwatt) {
    return double.parse((powerwatt / 745.7).toStringAsFixed(4));
  }

  double HorsepowerToWatt(double powerhorsepower) {
    return double.parse((powerhorsepower * 745.7).toStringAsFixed(4));
  }
}