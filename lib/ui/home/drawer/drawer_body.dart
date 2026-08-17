import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/widgets/divider_item.dart';
import 'package:news_app/ui/home/drawer/widgets/drawer_item.dart';
import 'package:news_app/ui/home/drawer/widgets/drop_down_item.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/size_utils.dart';

class DrawerBody extends StatelessWidget {
  final VoidCallback onTap;
  const DrawerBody({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      children: [
        Container(
          height: height * 0.166,
          alignment: .center,
          color: AppColors.whiteColor,
          child: Text('news_app'.tr(), style: AppStyles.bold24Black),
        ),
        SizedBox(height: height * 0.016),
        InkWell(
          overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
          onTap: onTap,
          child: DrawerItem(
            imageIcon: AppAssets.homeIcon,
            title: 'go_to_home'.tr(),
          ),
        ),
        DividerItem(),
        DrawerItem(imageIcon: AppAssets.themeIcon, title: 'theme'.tr()),
        SizedBox(height: height * 0.008),
        DropDownItem(isDropTheme: true),
        DividerItem(),
        DrawerItem(imageIcon: AppAssets.languageIcon, title: 'language'.tr()),
        SizedBox(height: height * 0.008),
        DropDownItem(),
      ],
    );
  }
}
