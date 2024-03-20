import 'package:flutter/material.dart';
import 'package:your_bike_admin/components/custom_dialogue.dart';
import 'package:your_bike_admin/components/custom_text_field.dart';
import 'package:your_bike_admin/utilities/app_size.dart';

import '../utilities/app_strings.dart';

/// Created by Neloy on 3/20/2024
/// Email: taufiqneloy.swe@gmail.com

class EditBikeDetails extends StatefulWidget {
  const EditBikeDetails({super.key});

  @override
  State<EditBikeDetails> createState() => _EditBikeDetailsState();
}

class _EditBikeDetailsState extends State<EditBikeDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController ccController = TextEditingController();
  TextEditingController gearsController = TextEditingController();
  TextEditingController maxPowerController = TextEditingController();
  TextEditingController maxTorqueController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController fuelTankCapacityController = TextEditingController();
  TextEditingController engineOilCapacityController = TextEditingController();
  TextEditingController seatHeightController = TextEditingController();
  TextEditingController frontSuspensionController = TextEditingController();
  TextEditingController rearSuspensionController = TextEditingController();
  TextEditingController frontBreakController = TextEditingController();
  TextEditingController rearBreakController = TextEditingController();
  TextEditingController frontWheelController = TextEditingController();
  TextEditingController rearWheelController = TextEditingController();
  TextEditingController frontTyreController = TextEditingController();
  TextEditingController rearTyreController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    brandNameController.dispose();
    ccController.dispose();
    gearsController.dispose();
    maxPowerController.dispose();
    maxTorqueController.dispose();
    mileageController.dispose();
    fuelTankCapacityController.dispose();
    engineOilCapacityController.dispose();
    seatHeightController.dispose();
    frontSuspensionController.dispose();
    rearSuspensionController.dispose();
    frontBreakController.dispose();
    rearBreakController.dispose();
    frontWheelController.dispose();
    rearWheelController.dispose();
    frontTyreController.dispose();
    rearTyreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.editBikeDetails),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(25),
        children: [
          // name
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.name,
            hint: "bike",
          ),
          AppSize.gapH20,

          // brand name
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.brandName,
            hint: "bike",
          ),
          AppSize.gapH20,

          // cc
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.cc,
            hint: "bike",
          ),
          AppSize.gapH20,

          // gears
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.gears,
            hint: "bike",
          ),
          AppSize.gapH20,

          // max power
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.maxPower,
            hint: "bike",
          ),
          AppSize.gapH20,

          // max torque
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.maxTorque,
            hint: "bike",
          ),
          AppSize.gapH20,

          // mileage
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.mileage,
            hint: "bike",
          ),
          AppSize.gapH20,

          // fuel tank capacity
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.fuelTankCapacity,
            hint: "bike",
          ),
          AppSize.gapH20,

          // engine oil capacity
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.engineOilCapacity,
            hint: "bike",
          ),
          AppSize.gapH20,

          // seat height
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.seatHeight,
            hint: "bike",
          ),
          AppSize.gapH20,

          // front suspension
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.frontSuspension,
            hint: "bike",
          ),
          AppSize.gapH20,

          // rear suspension
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.rearSuspension,
            hint: "bike",
          ),
          AppSize.gapH20,

          // front break
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.frontBreak,
            hint: "bike",
          ),
          AppSize.gapH20,

          // rear break
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.rearBreak,
            hint: "bike",
          ),
          AppSize.gapH20,

          // front wheel
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.frontWheel,
            hint: "bike",
          ),
          AppSize.gapH20,

          // rear wheel
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.rearWheel,
            hint: "bike",
          ),
          AppSize.gapH20,

          // front tyre
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            label: AppStrings.frontTyre,
            hint: "bike",
          ),
          AppSize.gapH20,

          // rear tyre
          CustomTextField.get(
            context: context,
            controller: nameController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            label: AppStrings.rearTyre,
            hint: "bike",
          ),
          AppSize.gapH40,

          // save button
          MaterialButton(
            elevation: 0,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            onPressed: () {
              // CustomDialogue.simple(context: context, icon: Icons.verified_outlined, message: AppStrings.update, buttonText: AppStrings.done);
              // CustomDialogue.simple(context: context, icon: Icons.error_outline_outlined, message: AppStrings.checkYourInternet, buttonText: AppStrings.goBack);
              // CustomDialogue.functional(
              //   context: context,
              //   onPressed: () {},
              //   icon: Icons.logout,
              //   message: AppStrings.doYouWantToExitApp,
              // );
              // CustomDialogue.functional(
              //   context: context,
              //   onPressed: () {},
              //   icon: Icons.delete,
              //   message: AppStrings.doYouWantToDelete,
              // );
            },
            color: Colors.black,
            child: Text(
              AppStrings.save,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          AppSize.gapH10,

          // cancel button
          MaterialButton(
            elevation: 0,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            onPressed: () {},
            color: Colors.white,
            child: Text(
              AppStrings.cancel,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          AppSize.gapH40,
        ],
      ),
    );
  }
}
