import 'package:flutter/material.dart';

class Bytes {

  double bitsToBytes(double bits) {
    return bits / 8;
  }

  double bytesToKilobytes(double bytes) {
    return bytes / 1024;
  }

  double kilobytesToMegabytes(double kilobytes) {
    return kilobytes / 1024;
  }

  double megabytesToGigabytes(double megabytes) {
    return megabytes / 1024;
  }

  double gigabytesToTerabytes(double gigabytes) {
    return gigabytes / 1024;
  }

  double kilobytesToBytes(double kilobytes) {
    return kilobytes * 1024;
  }
}
