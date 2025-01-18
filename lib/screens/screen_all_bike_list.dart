import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_bike_admin/components/custom_dialogue.dart';
import 'package:your_bike_admin/components/custom_text_field.dart';
import 'package:your_bike_admin/network/helper/helper_get_all_bikes.dart';
import 'package:your_bike_admin/network/manager/manager_get_all_bikes.dart';
import 'package:your_bike_admin/network/model/model_bike.dart';
import 'package:your_bike_admin/screens/screen_add_bike.dart';
import 'package:your_bike_admin/screens/screen_bike_details.dart';
import 'package:your_bike_admin/screens/screen_notification.dart';
import 'package:your_bike_admin/screens/screen_user_login.dart';
import 'package:your_bike_admin/utilities/app_image_path.dart';
import 'package:your_bike_admin/utilities/app_size.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

import '../network/data/provider_get_all_bike.dart';

/// Created by Neloy on 3/16/2024
/// Email: taufiqneloy.swe@gmail.com

class AllBikeList extends ConsumerStatefulWidget {
  const AllBikeList({super.key});

  @override
  ConsumerState<AllBikeList> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<AllBikeList>
    implements GetAllBikesManager {
  TextEditingController searchController = TextEditingController();

  List<BikeModel> bikeList = [];
  List<BikeModel> finalBikeList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (ref.watch(allBikeList).isEmpty) {
          _getAllBikes();
        } else {
          setState(() {
            bikeList = ref.watch(allBikeList);
            finalBikeList = ref.watch(allBikeList);
          });
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (isPop) async {
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => const Notifications(),
                  ),
                );
              },
              icon: const Icon(
                Icons.notification_important,
              ),
            ),
          ],
        ),
        floatingActionButton: MaterialButton(
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
                builder: (builder) => const AddBike(),
              ),
            );
          },
          color: Colors.black,
          child: Text(
            AppStrings.addNewBike,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: ref.watch(allBikeList).isEmpty
            ? const SizedBox()
            : ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(25),
                children: [
                  // search field
                  CustomTextField.get(
                      context: context,
                      controller: searchController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      hint: AppStrings.bikeNameExample,
                      label: AppStrings.bikeName,
                      prefixWidget: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        final tempBikeList = bikeList.where((element) {
                          final bikeTextLowerCase = element.name!.toLowerCase();
                          final search = value.toLowerCase();
                          return bikeTextLowerCase.contains(search);
                        }).toList();
                        setState(() {
                          finalBikeList = tempBikeList;
                        });
                      }),
                  AppSize.gapH40,

                  // bike list
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: finalBikeList.length,
                      itemBuilder: (context, index) {
                        return _elementBike(bike: finalBikeList[index]);
                      }),
                  AppSize.gapH60,
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
                builder: (builder) => BikeDetails(
                  id: bike.id!,
                ),
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
                          const Base64Codec().normalize(bike.image!),
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
    await GetAllBikesHelper().connection(
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
  void success({required List<BikeModel> bikes, required String message}) {
    ref.read(allBikeList.notifier).state = bikes;
    bikeList = bikes;
    finalBikeList = bikes;
    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        if (bikes.isNotEmpty) {
          CustomDialogue.simple(
            context: context,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icons.verified_outlined,
            message: message,
            buttonText: AppStrings.close,
          );
        }
      },
    );
  }
}
