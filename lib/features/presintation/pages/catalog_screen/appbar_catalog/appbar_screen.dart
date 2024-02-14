import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../../assets/colors/color.dart';
import '../../../../../assets/widgets/icons.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({super.key});

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  TextEditingController? controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 116,
          title: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 273,
                    decoration: BoxDecoration(
                      color: textFieldNoFocusBackgound,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textBlack),
                      controller: controller,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            AppIcons.search,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller?.text = "";
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(AppIcons.plus),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      autofocus: true,
                    ),
                  ),
                  Gap(10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Yopish",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: yelwish),
                      ),
                    ),
                  )
                ]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gap(10),
            Text(
              "Ko‘p izlanganlar",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: textBlack),
            ),
            Gap(10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: textFieldNoFocusBackgound,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    SvgPicture.asset(AppIcons.dot),
                    Gap(12),
                    Text("Perforator", style: Theme.of(context).textTheme.labelLarge!.copyWith(color: textBlack),
                    )
                  ]),
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: textFieldNoFocusBackgound,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    SvgPicture.asset(AppIcons.dot),
                    Gap(12),
                    Text(
                      "Uniforma",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: textBlack),
                    )
                  ]),
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: textFieldNoFocusBackgound,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    SvgPicture.asset(AppIcons.dot),
                    Gap(12),
                    Text(
                      "Qizil bo‘yoq",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: textBlack),
                    )
                  ]),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: textFieldNoFocusBackgound,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    SvgPicture.asset(AppIcons.dot),
                    Gap(12),
                    Text(
                      "Yelim",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: textBlack),
                    )
                  ]),
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: textFieldNoFocusBackgound,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    SvgPicture.asset(AppIcons.dot),
                    const Gap(12),
                    Text(
                      "Jamlanma",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: textBlack),
                    )
                  ]),
                ),
                const Gap(10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: textFieldNoFocusBackgound,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    SvgPicture.asset(AppIcons.dot),
                    const Gap(12),
                    Text(
                      "Svarka moslamasi",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: textBlack),
                    )
                  ]),
                ),
              ],
            ),
            const Gap(20),
            Text(
              "Izlanganlar tarixi",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: textBlack),
            ),
            const Gap(10),
            Row(
              children: [
                SvgPicture.asset(AppIcons.plus),
                Gap(8),
                Text(
                  "Perforator",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            Row(
              children: [
                SvgPicture.asset(AppIcons.plus),
                const Gap(8),
                Text(
                  "Kaska",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            Row(
              children: [
                SvgPicture.asset(AppIcons.plus),
                Gap(8),
                Text(
                  "Maxsus kiyim",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
