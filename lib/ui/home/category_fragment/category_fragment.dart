import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/category/category_model.dart';
import 'package:news_app/ui/home/category_fragment/category_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class CategoryFragment extends StatelessWidget {
  final Function onCategoryClick;
  const CategoryFragment({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var categoryList = CategoryModel.getCategoryList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.035),
      child: SingleChildScrollView(
        child: Column(
          spacing: height * 0.016,
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: height * 0.008),
            Text(
              'good_morning'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor: WidgetStatePropertyAll(
                    AppColors.transparentColor,
                  ),
                  onTap: () {
                    onCategoryClick(categoryList[index]);
                  },
                  child: CategoryItem(
                    categoryModel: categoryList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.016),
              itemCount: categoryList.length,
            ),
          ],
        ),
      ),
    );
  }
}
