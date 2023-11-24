import 'package:flutter/material.dart';

class Energy{
  double SoundTOElectrical(double soundIentensity){
    return soundIentensity*0.5;
  }
  double heatToElectrical(double tempratureDifferent){
    return tempratureDifferent*0.8;
  }
  double motionToElectrical(double mehanicalMotion){
    return mehanicalMotion*1.2;
  }
  double mechanicalToElectrical(double mehanicalEnergy){
    return mehanicalEnergy*0.9;
  }
}