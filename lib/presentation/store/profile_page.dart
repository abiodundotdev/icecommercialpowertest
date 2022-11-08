import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/core/widgets/app_scaffold.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final dividerHeight = Gap(20.0.h);
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: "Profile",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints.tight(
                Size(
                  screenSize.width,
                  screenSize.height * .2,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AppImages.profileBgImage,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Align(
                    alignment: Alignment(0, 1),
                    child: ProfileImage(isMale: true),
                  )
                ],
              ),
            ),
            Gap(10.h),
            Column(
              children: [
                Text(
                  "Qazeem Abiodun",
                  style: textTheme.headline5!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Gap(5.0.h),
                const Text(
                  "qudusqazeem@gmail.com",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatCard(
                  color: AppColors.primary,
                  icon: AppIcons.cart,
                  title: "Progress order",
                  value: "10+",
                ),
                _StatCard(
                  color: const Color(0xFF297EFF),
                  icon: AppIcons.ticket,
                  title: "Promo codes",
                  value: "5",
                ),
                _StatCard(
                  color: const Color(0xFFFFC107),
                  icon: AppIcons.star,
                  title: "Reviews",
                  value: "4.5K",
                )
              ],
            ),
            Gap(10.0.h),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TitledCard(
                title: "Personal Information",
                content: Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const _InfoRowItem(
                            title: "Name: ", value: "Qazeem Abiodun"),
                        dividerHeight,
                        const _InfoRowItem(
                            title: "Email: ", value: "abiodundotdev@gmail.com"),
                        dividerHeight,
                        const _InfoRowItem(
                            title: "Location: ", value: "Nigeria"),
                        dividerHeight,
                        const _InfoRowItem(title: "Zip code: ", value: "1200"),
                        dividerHeight,
                        const _InfoRowItem(
                            title: "Phone number: ", value: "+2348103963814"),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InfoRowItem extends StatelessWidget {
  final String title;
  final String value;
  const _InfoRowItem({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;
  const _StatCard(
      {Key? key,
      required this.color,
      required this.icon,
      required this.title,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints.tight(Size.square(screenSize.width * .3)),
      padding: EdgeInsets.all(10.0.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundColor: color.withOpacity(.1),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
