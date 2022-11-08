import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/di.dart';
import 'package:icecommercialpowertest/presentation/store/widget/product_card.dart';
import 'package:icecommercialpowertest/presentation/store/widget/widget.dart';

class DashboadPage extends StatefulWidget {
  DashboadPage({Key? key}) : super(key: key);

  @override
  State<DashboadPage> createState() => _DashboadPageState();
}

class _DashboadPageState extends State<DashboadPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        child: const Text(
          "New Texas",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => print,
          icon: Icon(
            AppIcons.menu,
            color: Colors.black,
          ),
        ),
        trailing: IconButton(
          onPressed: () => print,
          icon: Icon(
            AppIcons.notification,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "Explore\n",
                children: [
                  TextSpan(
                    text: "best Outfits for you ?",
                    style: AppFont.bold(size: 14.0.sp).copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: AppTextStyle.medium, color: Colors.black),
            ),
            Gap(30.0.h),
            TextFormField(
              focusNode: FocusNode(canRequestFocus: false),
              decoration: InputDecoration(
                hintText: "Search items",
                contentPadding: EdgeInsets.all(5.0.w),
                prefixIcon: Icon(
                  AppIcons.search,
                ),
                suffixIcon: Icon(
                  AppIcons.menu,
                ),
              ),
            ),
            Gap(30.0.h),
            DashboardStateBuilder(
              builder: (data) {
                final categories = data.categories ?? [];
                return ConstrainedBox(
                  constraints: BoxConstraints.tight(
                    Size(MediaQuery.of(context).size.width, 80.h),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      categories.length,
                      (index) => CategoryCard(name: categories[index]),
                    ),
                  ),
                );
              },
            ),
            Gap(30.0.h),
            TitledCard(
              title: "New Arrival",
              extra: "See All",
              onExtraPressed: () => DI.get.navigator.store.toCarts(),
              extraTextStyle: const TextStyle(color: Colors.black45),
              content: DashboardStateBuilder(
                builder: (data) {
                  final products = data.products ?? [];
                  return ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      Size(MediaQuery.of(context).size.width, 180.h),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) =>
                          ProductCard(product: products[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, kBottomNavigationBarHeight + 10.h),
        child: AppBottomNavigationBar(
          items: [
            CustomButtomNavigationBarItem(
              isActive: true,
              icon: AppIcons.homeLight,
              activeIcon: AppIcons.home,
              index: 0,
              label: "Home",
            ),
            CustomButtomNavigationBarItem(
              isActive: false,
              icon: AppIcons.cartLight,
              activeIcon: AppIcons.cart,
              index: 1,
              label: "Cart",
              onTap: () => DI.get.navigator.store.toCarts(),
            ),
            CustomButtomNavigationBarItem(
              isActive: false,
              icon: AppIcons.heartLight,
              activeIcon: AppIcons.heart,
              index: 2,
              label: "Favorite",
              onTap: null,
            ),
            CustomButtomNavigationBarItem(
              isActive: false,
              icon: AppIcons.userLight,
              activeIcon: AppIcons.user,
              index: 3,
              label: "Profile",
              onTap: () => DI.get.navigator.store.toProfile(),
            ),
          ],
        ),
      ),
    );
  }
}
