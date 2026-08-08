import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/api/model/category/category_model.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    return Container(
      height: 198.h,
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(24),
        image: DecorationImage(image: AssetImage(categoryModel.image)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: isEven ? .end : .start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: !isEven ? 12.w : 0,
                end: isEven ? 12.w : 0,
              ),
              child: Text(
                categoryModel.title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Container(
              padding: .directional(
                start: isEven ? 16.w : 0,
                end: !isEven ? 16.w : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: .circular(84),
                color: AppColors.greyColor,
              ),
              child: Row(
                textDirection: isEven ? .ltr : .rtl,
                mainAxisSize: .min,
                spacing: 10.w,
                children: [
                  Text(
                    'View All',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: SvgPicture.asset(
                      isEven
                          ? AppAssets.arrowForwardLightIcon
                          : AppAssets.arrowBackLightIcon,
                      width: 28.w,
                      height: 28.h,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).splashColor,
                        .srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
