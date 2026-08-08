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
        title: 'General',
        image: isDark
            ? AppAssets.generalDarkImage
            : AppAssets.generalLightImage,
      ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        image: isDark
            ? AppAssets.businessDarkImage
            : AppAssets.businessLightImage,
      ),
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        image: isDark ? AppAssets.sportsDarkImage : AppAssets.sportsLightImage,
      ),
      CategoryModel(
        id: 'technology',
        title: 'Technology',
        image: isDark
            ? AppAssets.technologyDarkImage
            : AppAssets.technologyLightImage,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        image: isDark
            ? AppAssets.entertainmentDarkImage
            : AppAssets.entertainmentLightImage,
      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        image: isDark ? AppAssets.healthDarkImage : AppAssets.healthLightImage,
      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        image: isDark
            ? AppAssets.scienceDarkImage
            : AppAssets.scienceLightImage,
      ),
    ];
  }
}
