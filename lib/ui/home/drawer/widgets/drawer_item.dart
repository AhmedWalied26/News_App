import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class DrawerItem extends StatelessWidget {
  final String imageIcon;
  final String title;
  const DrawerItem({super.key, required this.imageIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.035),
      child: Row(
        spacing: width * 0.015,
        children: [
          SvgPicture.asset(imageIcon),
          Text(title, style: AppStyles.bold20White),
        ],
      ),
    );
  }
}
