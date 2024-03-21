import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_bike_admin/components/custom_dialogue.dart';
import 'package:your_bike_admin/screens/screen_bike_details.dart';
import 'package:your_bike_admin/utilities/app_image_path.dart';
import 'package:your_bike_admin/utilities/app_size.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

/// Created by Neloy on 3/16/2024
/// Email: taufiqneloy.swe@gmail.com

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> brandList = [
    "Yamaha",
    "Honda",
    "TVS",
  ];

  List<String> ccList = [
    "110",
    "125",
    "150",
    "155",
  ];
  String brandValue = "";
  String ccValue = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await CustomDialogue.functional(
            context: context,
            onPressed: () {
              // SystemNavigator.pop();
            },
            icon: Icons.logout,
            message: AppStrings.doYouWantToLogout);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.allBikeList),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(25),
          children: [
            // brand list
            DropdownMenu<String>(
              hintText: AppStrings.selectBrand,
              width: MediaQuery.of(context).size.width - 50,
              enableFilter: true,
              menuHeight: 200,
              onSelected: (String? value) {
                FocusManager.instance.primaryFocus?.unfocus();
                // This is called when the user selects an item.
                setState(() {
                  brandValue = value!;
                });
              },
              dropdownMenuEntries: brandList.map<DropdownMenuEntry<String>>(
                (String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            AppSize.gapH20,

            // cc list
            DropdownMenu<String>(
              hintText: AppStrings.selectCC,
              width: MediaQuery.of(context).size.width - 50,
              enableFilter: true,
              menuHeight: 200,
              onSelected: (String? value) {
                FocusManager.instance.primaryFocus?.unfocus();
                // This is called when the user selects an item.
                setState(() {
                  ccValue = value!;
                });
              },
              dropdownMenuEntries: ccList.map<DropdownMenuEntry<String>>(
                (String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            AppSize.gapH40,

            // bike list
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _elementBike();
                }),
            AppSize.gapH40,
          ],
        ),
      ),
    );
  }

  Widget _elementBike() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => const BikeDetails(),
              ),
            );
          },
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Row(
              children: [
                // image
                Image.asset(
                  AppImagePath.cover,
                  height: 80,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                AppSize.gapW20,

                // name, brand
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "R15M (2024 special edition)",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Yamaha",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        AppStrings.tapToSeeEditDetails,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        AppSize.gapH20,
      ],
    );
  }
}
