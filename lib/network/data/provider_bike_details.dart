import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/model_bike.dart';

/// Created by Neloy on 3/28/2024
/// Email: taufiqneloy.swe@gmail.com

final bikeDetails = StateProvider<BikeModel>((ref) => BikeModel());
