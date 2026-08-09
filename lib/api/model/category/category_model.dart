import 'package:easy_localization/easy_localization.dart';
import 'package:news_app/utils/app_assets.dart';

class CategoryModel {
  String id;
  String image;
  String title;

  CategoryModel({required this.id, required this.image, required this.title});

  static List<CategoryModel> getCategoryList({required bool isDark}) {
    return [
      CategoryModel(
        id: 'general',
        title: 'general'.tr(),
        image: isDark
            ? AppAssets.generalDarkImage
            : AppAssets.generalLightImage,
      ),
      CategoryModel(
        id: 'business',
        title: 'business'.tr(),
        image: isDark
            ? AppAssets.businessDarkImage
            : AppAssets.businessLightImage,
      ),
      CategoryModel(
        id: 'sports',
        title: 'sports'.tr(),
        image: isDark ? AppAssets.sportsDarkImage : AppAssets.sportsLightImage,
      ),
      CategoryModel(
        id: 'technology',
        title: 'technology'.tr(),
        image: isDark
            ? AppAssets.technologyDarkImage
            : AppAssets.technologyLightImage,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'entertainment'.tr(),
        image: isDark
            ? AppAssets.entertainmentDarkImage
            : AppAssets.entertainmentLightImage,
      ),
      CategoryModel(
        id: 'health',
        title: 'health'.tr(),
        image: isDark ? AppAssets.healthDarkImage : AppAssets.healthLightImage,
      ),
      CategoryModel(
        id: 'science',
        title: 'science'.tr(),
        image: isDark
            ? AppAssets.scienceDarkImage
            : AppAssets.scienceLightImage,
      ),
    ];
  }
}
