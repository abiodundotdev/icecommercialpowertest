import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';

class DropDownItemsView extends StatelessWidget {
  DropDownItemsView({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);
  final List<String> items;
  final String title;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: CustomAppBar(
          title: title,
          titleTextStyle: const TextStyle(
            color: AppColors.lightGrey,
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
          ),
          leading: AppCloseButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: ValueListenableBuilder(
            valueListenable: searchController,
            builder: (context, TextEditingValue value, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search ... ",
                      contentPadding: EdgeInsets.all(5.0.w),
                    ),
                  ),
                  Gap(20.0.h),
                  ValueListenableBuilder(
                    valueListenable: searchController,
                    builder: (a, TextEditingValue value, _) {
                      final searchItems = items
                          .where(
                            (element) => element
                                .toLowerCase()
                                .contains(value.text.toLowerCase()),
                          )
                          .toList();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < searchItems.length; i++) ...[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(searchItems[i]);
                              },
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Text(searchItems[i],
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                            ),
                            Gap(5.0.h),
                            const Divider(
                              thickness: 1,
                            )
                          ]
                        ],
                      );
                    },
                  )
                ],
              );
            },
          ),
        ));
  }
}
