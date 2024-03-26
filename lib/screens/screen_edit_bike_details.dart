import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_bike_admin/components/custom_dialogue.dart';
import 'package:your_bike_admin/components/custom_text_field.dart';
import 'package:your_bike_admin/screens/screen_user_login.dart';
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

  String imageData = "";

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
          title: const Text(AppStrings.editBikeDetails),
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
            // image selection part
            imageData.isNotEmpty
                ? Image.memory(
                    base64Decode(imageData),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  )
                : Container(
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: const Icon(
                      Icons.image,
                      color: Colors.black12,
                      size: 100,
                    ),
                  ),
            AppSize.gapH10,

            TextButton.icon(
              onPressed: () {
                pickImage();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              icon: const Icon(
                Icons.image,
                color: Colors.black,
              ),
              label: Text(
                AppStrings.addBikeImage,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            AppSize.gapH40,

            // name
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.name,
              hint: AppStrings.bikeNameExample,
            ),
            AppSize.gapH20,

            // brand name
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.brandName,
              hint: AppStrings.brandNameExample,
            ),
            AppSize.gapH20,

            // cc
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.cc,
              hint: AppStrings.ccExample,
            ),
            AppSize.gapH20,

            // gears
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.gears,
              hint: AppStrings.gearCountExample,
            ),
            AppSize.gapH20,

            // max power
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.maxPower,
              hint: AppStrings.maxPowerCountExample,
            ),
            AppSize.gapH20,

            // max torque
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.maxTorque,
              hint: AppStrings.maxTorqueCountExample,
            ),
            AppSize.gapH20,

            // mileage
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.mileage,
              hint: AppStrings.mileageExample,
            ),
            AppSize.gapH20,

            // fuel tank capacity
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.fuelTankCapacity,
              hint: AppStrings.fuelTankCapacityExample,
            ),
            AppSize.gapH20,

            // engine oil capacity
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.engineOilCapacity,
              hint: AppStrings.engineOilCapacityExample,
            ),
            AppSize.gapH20,

            // seat height
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.seatHeight,
              hint: AppStrings.seatHeightExample,
            ),
            AppSize.gapH20,

            // front suspension
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.frontSuspension,
              hint: AppStrings.frontSuspensionExample,
            ),
            AppSize.gapH20,

            // rear suspension
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.rearSuspension,
              hint: AppStrings.rearSuspensionExample,
            ),
            AppSize.gapH20,

            // front break
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.frontBreak,
              hint: AppStrings.frontBreakExample,
            ),
            AppSize.gapH20,

            // rear break
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.rearBreak,
              hint: AppStrings.rearBreakExample,
            ),
            AppSize.gapH20,

            // front wheel
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.frontWheel,
              hint: AppStrings.frontWheelExample,
            ),
            AppSize.gapH20,

            // rear wheel
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.rearWheel,
              hint: AppStrings.rearWheelExample,
            ),
            AppSize.gapH20,

            // front tyre
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: AppStrings.frontTyre,
              hint: AppStrings.frontTyreExample,
            ),
            AppSize.gapH20,

            // rear tyre
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              label: AppStrings.rearTyre,
              hint: AppStrings.rearTyreExample,
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
      ),
    );
  }

  Future pickImage() async {
    final selectImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    List<int> bytes = await selectImage!.readAsBytes();
    setState(() {
      imageData = base64Encode(bytes);
    });
  }
}
