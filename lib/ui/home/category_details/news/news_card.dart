import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news_response/article.dart';
import 'package:news_app/api/model/news_response/news_response.dart';
import 'package:news_app/api/model/source_response/source.dart';
import 'package:news_app/ui/home/category_details/news/news_details/news_details.dart';
import 'package:news_app/ui/home/category_details/news/widgets/news_card_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widgets/main_error.dart';
import 'package:news_app/widgets/main_waiting.dart';

class NewsCard extends StatefulWidget {
  final Source source;
  const NewsCard({super.key, required this.source});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(
        widget.source.id ?? '',
        context.locale.languageCode,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainWaiting();
        } else if (snapshot.hasError) {
          return MainError(
            onTap: () {
              ApiManager.getNewsBySourceId(
                widget.source.id ?? '',
                context.locale.languageCode,
              );
              setState(() {});
            },
          );
        }
        var newsList = snapshot.data!.articles;
        return newsList!.isEmpty
            ? Center(
                child: Text(
                  'no_news_found'.tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    overlayColor: WidgetStatePropertyAll(
                      AppColors.transparentColor,
                    ),
                    onTap: () {
                      showBottomSheet(context, newsList[index]);
                    },
                    child: NewsCardItem(
                      image: newsList[index].urlToImage ?? '',
                      title: newsList[index].title ?? '',
                      author: newsList[index].author ?? 'Unknown',
                      publishedAt: newsList[index].publishedAt ?? '',
                    ),
                  );
                },
              );
      },
    );
  }

  void showBottomSheet(BuildContext context, Article article) {
    showModalBottomSheet(
      backgroundColor: AppColors.transparentColor,
      context: context,
      builder: (context) => NewsDetails(article: article),
    );
  }
}
