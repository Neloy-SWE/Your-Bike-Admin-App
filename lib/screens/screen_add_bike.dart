import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_bike_admin/network/helper/helper_add_bike.dart';
import 'package:your_bike_admin/network/model/model_add_bike.dart';
import 'package:your_bike_admin/network/model/model_bike.dart';
import 'package:your_bike_admin/screens/screen_user_login.dart';

import '../components/custom_dialogue.dart';
import '../components/custom_text_field.dart';
import '../network/data/provider_get_all_bike.dart';
import '../network/manager/manager_get_all_bikes.dart';
import '../utilities/app_size.dart';
import '../utilities/app_strings.dart';

/// Created by Neloy on 3/26/2024
/// Email: taufiqneloy.swe@gmail.com

class AddBike extends ConsumerStatefulWidget {
  const AddBike({super.key});

  @override
  ConsumerState<AddBike> createState() => _AddBikeState();
}

class _AddBikeState extends ConsumerState<AddBike>
    implements GetAllBikesManager {
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

  final _addBikeKey = GlobalKey<FormState>();

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
          title: const Text(AppStrings.addNewBike),
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
                _pickImage();
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

            Form(
              key: _addBikeKey,
              child: Column(
                children: [
                  // name
                  CustomTextField.get(
                    context: context,
                    controller: nameController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.name,
                    hint: AppStrings.bikeNameExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // brand name
                  CustomTextField.get(
                    context: context,
                    controller: brandNameController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.brandName,
                    hint: AppStrings.brandNameExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // cc
                  CustomTextField.get(
                    context: context,
                    controller: ccController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.cc,
                    hint: AppStrings.ccExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // gears
                  CustomTextField.get(
                    context: context,
                    controller: gearsController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.gears,
                    hint: AppStrings.gearCountExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // max power
                  CustomTextField.get(
                    context: context,
                    controller: maxPowerController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.maxPower,
                    hint: AppStrings.maxPowerCountExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // max torque
                  CustomTextField.get(
                    context: context,
                    controller: maxTorqueController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.maxTorque,
                    hint: AppStrings.maxTorqueCountExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // mileage
                  CustomTextField.get(
                    context: context,
                    controller: mileageController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.mileage,
                    hint: AppStrings.mileageExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // fuel tank capacity
                  CustomTextField.get(
                    context: context,
                    controller: fuelTankCapacityController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.fuelTankCapacity,
                    hint: AppStrings.fuelTankCapacityExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // engine oil capacity
                  CustomTextField.get(
                    context: context,
                    controller: engineOilCapacityController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.engineOilCapacity,
                    hint: AppStrings.engineOilCapacityExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // seat height
                  CustomTextField.get(
                    context: context,
                    controller: seatHeightController,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.seatHeight,
                    hint: AppStrings.seatHeightExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // front suspension
                  CustomTextField.get(
                    context: context,
                    controller: frontSuspensionController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.frontSuspension,
                    hint: AppStrings.frontSuspensionExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // rear suspension
                  CustomTextField.get(
                    context: context,
                    controller: rearSuspensionController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.rearSuspension,
                    hint: AppStrings.rearSuspensionExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // front break
                  CustomTextField.get(
                    context: context,
                    controller: frontBreakController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.frontBreak,
                    hint: AppStrings.frontBreakExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // rear break
                  CustomTextField.get(
                    context: context,
                    controller: rearBreakController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.rearBreak,
                    hint: AppStrings.rearBreakExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // front wheel
                  CustomTextField.get(
                    context: context,
                    controller: frontWheelController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.frontWheel,
                    hint: AppStrings.frontWheelExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // rear wheel
                  CustomTextField.get(
                    context: context,
                    controller: rearWheelController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.rearWheel,
                    hint: AppStrings.rearWheelExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // front tyre
                  CustomTextField.get(
                    context: context,
                    controller: frontTyreController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.frontTyre,
                    hint: AppStrings.frontTyreExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // rear tyre
                  CustomTextField.get(
                    context: context,
                    controller: rearTyreController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    label: AppStrings.rearTyre,
                    hint: AppStrings.rearTyreExample,
                    validatorFunction: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return AppStrings.emptyField;
                      }
                    },
                  ),
                  AppSize.gapH40,
                ],
              ),
            ),

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
                if (imageData.isEmpty) {
                  CustomDialogue.simple(
                    context: context,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icons.error_outline_outlined,
                    message: AppStrings.pleaseSelectImage,
                    buttonText: AppStrings.close,
                  );
                }
                if (_addBikeKey.currentState!.validate()) {
                  _addBike();
                }
              },
              color: Colors.black,
              child: Text(
                AppStrings.add,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            AppSize.gapH40,
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final selectImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    List<int> bytes = await selectImage!.readAsBytes();
    setState(() {
      imageData = base64Encode(bytes);
    });
  }

  Future<void> _addBike() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    CustomDialogue.loading(context: context);

    AddBikeModel bike = AddBikeModel(
      name: nameController.text,
      image: imageData,
      brandName: brandNameController.text,
      cc: double.parse(ccController.text),
      gears: int.parse(gearsController.text),
      maxPower: maxPowerController.text,
      maxTorque: maxTorqueController.text,
      mileage: mileageController.text,
      fuelTankCapacity: double.parse(fuelTankCapacityController.text),
      engineOilCapacity: double.parse(engineOilCapacityController.text),
      seatHeight: double.parse(seatHeightController.text),
      frontSuspension: frontSuspensionController.text,
      rearSuspension: rearSuspensionController.text,
      frontBreak: frontBreakController.text,
      rearBreak: rearBreakController.text,
      frontWheel: frontWheelController.text,
      rearWheel: rearWheelController.text,
      frontTyre: frontTyreController.text,
      rearTyre: rearTyreController.text,
    );

    await AddBikeHelper().connection(
      manager: this,
      bike: bike,
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
  void success({required List<BikeModel> bikes, required String message}) {
    ref.read(allBikeList.notifier).state = bikes;
    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          icon: Icons.verified_outlined,
          message: message,
          buttonText: AppStrings.close,
        );
      },
    );
  }
}
