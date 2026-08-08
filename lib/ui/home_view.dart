import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/ui/category_details/category_details.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: SvgPicture.asset(
              AppAssets.searchIcon,
              colorFilter: ColorFilter.mode(AppColors.blackColor, .srcIn),
            ),
          ),
        ],
      ),

      body: CategoryDetails(),
    );
  }
}
