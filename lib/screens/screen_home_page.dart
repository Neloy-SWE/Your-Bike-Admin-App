import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_bike_admin/components/custom_dialogue.dart';
import 'package:your_bike_admin/network/helper/helper_get_all_bikes.dart';
import 'package:your_bike_admin/network/manager/manager_get_all_bikes.dart';
import 'package:your_bike_admin/network/model/model_bike.dart';
import 'package:your_bike_admin/screens/screen_bike_details.dart';
import 'package:your_bike_admin/screens/screen_user_login.dart';
import 'package:your_bike_admin/utilities/app_image_path.dart';
import 'package:your_bike_admin/utilities/app_size.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

import '../network/data/provider_get_all_bike.dart';

/// Created by Neloy on 3/16/2024
/// Email: taufiqneloy.swe@gmail.com

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    implements GetAllBikesManager {
  List<String> brandList = [];
  List<String> ccList = [];
  String brandValue = "";
  String ccValue = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _getAllBikes();
      },
    );

    super.initState();
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
          title: const Text(AppStrings.allBikeList),
        ),
        body: ref.watch(allBikeList).isEmpty
            ? const SizedBox()
            : ListView(
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
                    dropdownMenuEntries:
                        brandList.map<DropdownMenuEntry<String>>(
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
                      itemCount: ref.watch(allBikeList).length,
                      itemBuilder: (context, index) {
                        return _elementBike(
                            bike: ref.watch(allBikeList)[index]);
                      }),
                  AppSize.gapH40,
                ],
              ),
      ),
    );
  }

  Widget _elementBike({required BikeModel bike}) {
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
                bike.image!.isEmpty || bike.image == null
                    ? Image.asset(
                        AppImagePath.cover,
                        height: 80,
                        width: 100,
                        fit: BoxFit.fill,
                      )
                    : Image.memory(
                        base64Decode(
                          bike.image!,
                        ),
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
                        bike.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        bike.brandName!,
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

  Future<void> _getAllBikes() async {
    CustomDialogue.loading(context: context);
    await GetAllBikesHelper().connection(manager: this);
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
    for (int i = 0; i < bikes.length; i++) {
      brandList.add(bikes[i].brandName!);
      ccList.add(bikes[i].cc!.toString());
    }
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
}
