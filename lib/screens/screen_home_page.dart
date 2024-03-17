import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allBikeList),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(25),
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return _elementBike();
              })
        ],
      ),
    );
  }

  Widget _elementBike() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(":::::Tap:::::");
          },
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
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
