import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_bike_admin/network/data/provider_get_all_bike.dart';
import 'package:your_bike_admin/network/helper/helper_delete_manager.dart';
import 'package:your_bike_admin/network/model/model_bike.dart';
import 'package:your_bike_admin/screens/screen_all_bike_list.dart';
import 'package:your_bike_admin/screens/screen_edit_bike_details.dart';
import 'package:your_bike_admin/screens/screen_user_login.dart';
import 'package:your_bike_admin/utilities/app_size.dart';

import '../components/custom_dialogue.dart';
import '../network/data/provider_bike_details.dart';
import '../network/helper/helper_bike_details.dart';
import '../network/manager/manager_bike_details.dart';
import '../network/manager/manager_delete_bike.dart';
import '../utilities/app_strings.dart';

/// Created by Neloy on 3/19/2024
/// Email: taufiqneloy.swe@gmail.com

class BikeDetails extends ConsumerStatefulWidget {
  final int id;

  const BikeDetails({super.key, required this.id});

  @override
  ConsumerState<BikeDetails> createState() => _BikeDetailsState();
}

class _BikeDetailsState extends ConsumerState<BikeDetails>
    implements BikeDetailsManager, DeleteBikeManager {
  BikeModel? bike;

  ScrollController controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (ref.watch(bikeDetails).name == null) {
          _getBikeDetails();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bike = ref.watch(bikeDetails);
    return WillPopScope(
      onWillPop: () async {
        return await CustomDialogue.decision(
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
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (builder) => const AllBikeList(),
                ),
                (Route<dynamic> route) => false,
              );
              ref.read(bikeDetails.notifier).state = BikeModel();
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
        body: ref.watch(bikeDetails).name == null
            ? const SizedBox()
            : ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(25),
                controller: controller,
                children: [
                  // bike image
                  Image.memory(
                    base64Decode(
                      const Base64Codec().normalize(bike!.image!),
                    ),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  AppSize.gapH40,

                  // details
                  // name
                  _detailsContainer(
                    title: AppStrings.name,
                    details: bike!.name!,
                  ),

                  // brand name
                  _detailsContainer(
                    title: AppStrings.brandName,
                    details: bike!.brandName!,
                  ),

                  // cc
                  _detailsContainer(
                    title: AppStrings.cc,
                    details: bike!.cc.toString(),
                  ),

                  // gears
                  _detailsContainer(
                    title: AppStrings.gears,
                    details: bike!.gears.toString(),
                  ),

                  // max power
                  _detailsContainer(
                    title: AppStrings.maxPower,
                    details: bike!.maxPower!,
                  ),

                  // max torque
                  _detailsContainer(
                    title: AppStrings.maxTorque,
                    details: bike!.maxTorque!,
                  ),

                  // mileage
                  _detailsContainer(
                    title: AppStrings.mileage,
                    details: bike!.mileage!,
                  ),

                  // fuel tank capacity
                  _detailsContainer(
                    title: AppStrings.fuelTankCapacity,
                    details: bike!.fuelTankCapacity.toString(),
                  ),

                  // engine oil capacity
                  _detailsContainer(
                    title: AppStrings.engineOilCapacity,
                    details: bike!.engineOilCapacity.toString(),
                  ),

                  // seat height
                  _detailsContainer(
                    title: AppStrings.seatHeight,
                    details: bike!.seatHeight.toString(),
                  ),

                  // front suspension
                  _detailsContainer(
                    title: AppStrings.frontSuspension,
                    details: bike!.frontSuspension!,
                  ),

                  // rear suspension
                  _detailsContainer(
                    title: AppStrings.rearSuspension,
                    details: bike!.rearSuspension!,
                  ),

                  // front break
                  _detailsContainer(
                    title: AppStrings.frontBreak,
                    details: bike!.frontBreak!,
                  ),

                  // rear break
                  _detailsContainer(
                    title: AppStrings.rearBreak,
                    details: bike!.rearBreak!,
                  ),

                  // front wheel
                  _detailsContainer(
                    title: AppStrings.frontWheel,
                    details: bike!.frontWheel!,
                  ),

                  // rear wheel
                  _detailsContainer(
                    title: AppStrings.rearWheel,
                    details: bike!.rearBreak!,
                  ),

                  // front tyre
                  _detailsContainer(
                    title: AppStrings.frontTyre,
                    details: bike!.frontTyre!,
                  ),

                  // rear tyre
                  _detailsContainer(
                    title: AppStrings.rearTyre,
                    details: bike!.rearTyre!,
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
                          builder: (builder) => EditBikeDetails(
                            id: widget.id,
                          ),
                        ),
                      );
                      controller.animateTo(
                        0.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
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
                    onPressed: () {
                      CustomDialogue.decision(
                        context: context,
                        onPressed: () {
                          _deleteBike();
                        },
                        icon: Icons.delete_forever_sharp,
                        message: AppStrings.doYouWantToDelete,
                      );
                    },
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

  Future<void> _getBikeDetails() async {
    CustomDialogue.loading(context: context);
    await BikeDetailsHelper().connection(
      id: widget.id,
      manager: this,
    );
  }

  Future<void> _deleteBike() async {
    Navigator.of(context).pop();
    CustomDialogue.loading(context: context);
    await DeleteBikeHelper().connection(
      id: widget.id,
      manager: this,
    );
  }

  @override
  void fail({required String message}) {
    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icons.error_outline_outlined,
          message: message,
          buttonText: AppStrings.close,
        );
      },
    );
  }

  @override
  void success({required BikeModel bike, required String message}) {
    ref.read(bikeDetails.notifier).state = bike;
    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icons.verified_outlined,
          message: message,
          buttonText: AppStrings.close,
        );
      },
    );
  }

  @override
  void deleteSuccess({required String message}) {
    ref
        .read(allBikeList.notifier)
        .state
        .removeWhere((element) => element.id == widget.id);

    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
          () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (builder) => const AllBikeList(),
              ),
                  (Route<dynamic> route) => false,
            );
          },
          icon: Icons.verified_outlined,
          message: message,
          buttonText: AppStrings.close,
        );
      },
    );
  }
}
