import '../model/model_bike.dart';

/// Created by Neloy on 3/28/2024
/// Email: taufiqneloy.swe@gmail.com

abstract class BikeDetailsManager {
  void success({required BikeModel bike, required String message});

  void fail({required String message});
}
