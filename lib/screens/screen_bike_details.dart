import 'package:flutter/material.dart';
import 'package:your_bike_admin/utilities/app_size.dart';

import '../utilities/app_strings.dart';

/// Created by Neloy on 3/19/2024
/// Email: taufiqneloy.swe@gmail.com

class BikeDetails extends StatefulWidget {
  const BikeDetails({super.key});

  @override
  State<BikeDetails> createState() => _BikeDetailsState();
}

class _BikeDetailsState extends State<BikeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bikeDetails),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(25),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever_sharp,
                  color: Colors.red,
                ),
              ),
              AppSize.gapW20,
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_note_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
