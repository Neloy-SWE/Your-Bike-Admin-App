import 'package:flutter/material.dart';
import 'package:your_bike_admin/components/custom_text_field.dart';

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

  @override
  void dispose() {
    nameController.dispose();
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
            CustomTextField.get(
              context: context,
              controller: nameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              label: "Ok",
              hint: "bike",
            ),
          ]),
    );
  }
}
