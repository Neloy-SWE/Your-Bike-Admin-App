import 'package:flutter/material.dart';
import 'package:your_bike_admin/screens/screen_edit_bike_details.dart';
import 'package:your_bike_admin/screens/screen_user_login.dart';
import 'package:your_bike_admin/utilities/app_size.dart';

import '../components/custom_dialogue.dart';
import '../utilities/app_image_path.dart';
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
    return WillPopScope(
      onWillPop: () async {
        return await CustomDialogue.functional(
          context: context,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (builder) => const Login(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          icon: Icons.logout,
          message: AppStrings.doYouWantToLogout,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.bikeDetails),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(25),
          children: [
            // bike image
            Image.asset(
              AppImagePath.cover,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            AppSize.gapH40,

            // details
            // name
            _detailsContainer(
              title: AppStrings.name,
              details: "R15M (2024 Edition)",
            ),

            // brand name
            _detailsContainer(
              title: AppStrings.brandName,
              details: "Yamaha",
            ),

            // cc
            _detailsContainer(
              title: AppStrings.cc,
              details: "Yamaha",
            ),

            // gears
            _detailsContainer(
              title: AppStrings.gears,
              details: "Yamaha",
            ),

            // max power
            _detailsContainer(
              title: AppStrings.maxPower,
              details: "Yamaha",
            ),

            // max torque
            _detailsContainer(
              title: AppStrings.maxTorque,
              details: "Yamaha",
            ),

            // mileage
            _detailsContainer(
              title: AppStrings.mileage,
              details: "Yamaha",
            ),

            // fuel tank capacity
            _detailsContainer(
              title: AppStrings.fuelTankCapacity,
              details: "Yamaha",
            ),

            // engine oil capacity
            _detailsContainer(
              title: AppStrings.engineOilCapacity,
              details: "Yamaha",
            ),

            // seat height
            _detailsContainer(
              title: AppStrings.seatHeight,
              details: "Yamaha",
            ),

            // front suspension
            _detailsContainer(
              title: AppStrings.frontSuspension,
              details: "Yamaha",
            ),

            // rear suspension
            _detailsContainer(
              title: AppStrings.rearSuspension,
              details: "Yamaha",
            ),

            // front break
            _detailsContainer(
              title: AppStrings.frontBreak,
              details: "Yamaha",
            ),

            // rear break
            _detailsContainer(
              title: AppStrings.rearBreak,
              details: "Yamaha",
            ),

            // front wheel
            _detailsContainer(
              title: AppStrings.frontWheel,
              details: "Yamaha",
            ),

            // rear wheel
            _detailsContainer(
              title: AppStrings.rearWheel,
              details: "Yamaha",
            ),

            // front tyre
            _detailsContainer(
              title: AppStrings.frontTyre,
              details: "Yamaha",
            ),

            // rear tyre
            _detailsContainer(
              title: AppStrings.rearTyre,
              details: "Yamaha",
            ),
            AppSize.gapH20,

            // edit button
            MaterialButton(
              elevation: 0,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const EditBikeDetails(),
                  ),
                );
              },
              color: Colors.black,
              child: Text(
                AppStrings.edit,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            AppSize.gapH10,

            // delete button
            MaterialButton(
              elevation: 0,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              onPressed: () {},
              color: Colors.red,
              child: Text(
                AppStrings.delete,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            AppSize.gapH40,
          ],
        ),
      ),
    );
  }

  Widget _detailsContainer({required String title, required String details}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.red),
        ),
        AppSize.gapH10,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Text(
            details,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        AppSize.gapH20,
      ],
    );
  }
}
