import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/api/model/category/category_model.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';
import 'package:provider/provider.dart';

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
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    bool isEven = index % 2 == 0;
    return Container(
      height: height * 0.22,
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(24),
        image: DecorationImage(
          fit: .cover,
          image: AssetImage(
            themeProvider.appTheme == .dark
                ? categoryModel.darkImage
                : categoryModel.lightImage,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
        child: Column(
          textDirection: .ltr,
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: isEven ? .end : .start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: !isEven ? width * 0.03 : 0,
                end: isEven ? width * 0.03 : 0,
              ),
              child: Text(
                capitalize(categoryModel.title.tr()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Container(
              padding: .directional(
                start: context.locale.languageCode == 'en'
                    ? isEven
                          ? width * 0.035
                          : 0
                    : !isEven
                    ? width * 0.035
                    : 0,
                end: context.locale.languageCode == 'ar'
                    ? isEven
                          ? width * 0.035
                          : 0
                    : !isEven
                    ? width * 0.035
                    : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: .circular(84),
                color: AppColors.greyColor,
              ),
              child: Row(
                textDirection: isEven ? .ltr : .rtl,
                mainAxisSize: .min,
                spacing: width * 0.025,
                children: [
                  Text(
                    'view_all'.tr(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: SvgPicture.asset(
                      isEven
                          ? AppAssets.arrowForwardLightIcon
                          : AppAssets.arrowBackLightIcon,
                      width: width * 0.07,
                      height: height * 0.028,
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

  String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
