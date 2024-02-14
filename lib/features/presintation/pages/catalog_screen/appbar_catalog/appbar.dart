import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../assets/colors/color.dart';
import '../../../../../assets/widgets/icons.dart';

import 'appbar_screen.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 160,
      title: Padding(
        padding:
        EdgeInsets.only(left: 20, top: MediaQuery.of(context).padding.top),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        AppIcons.menu,
                      ),
                    ),
                  ),
                  Text(
                    "Katalog",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: textBlack),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AppBarScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20, top: 42),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: textFieldNoFocusBackgound),
                  child: Row(children: [
                    SvgPicture.asset(AppIcons.search),
                    Gap(18),
                    Text(
                      "Izlash",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: greyishText),
                    )
                  ]),
                ),
              ),
            ]),
      ));
}
