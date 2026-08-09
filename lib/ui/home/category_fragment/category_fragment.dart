import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/model/category/category_model.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/category_fragment/category_item.dart';
import 'package:provider/provider.dart';

class CategoryFragment extends StatelessWidget {
  final Function onCategoryClick;
  const CategoryFragment({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var categoryList = CategoryModel.getCategoryList(
      isDark: themeProvider.appTheme == .dark,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 16.h),
            Text(
              'good_morning'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categoryList[index]);
                  },
                  child: CategoryItem(
                    categoryModel: categoryList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: categoryList.length,
            ),
          ],
        ),
      ),
    );
  }
}
