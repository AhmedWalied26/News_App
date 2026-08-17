import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/ui/home/search/widgets/custom_text_field.dart';
import 'package:news_app/ui/home/search/widgets/search_news.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/size_utils.dart';

class SearchBody extends StatelessWidget {
  final VoidCallback onCancelClick;
  final Function onChanged;
  final String searchText;

  const SearchBody({
    super.key,
    required this.onCancelClick,
    required this.onChanged,
    required this.searchText,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return SafeArea(
      child: Column(
        spacing: height * 0.016,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035),
            child: CustomTextField(
              onChanged: (value) {
                onChanged(value);
              },
              prefix: SvgPicture.asset(
                AppAssets.searchIcon,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).splashColor,
                  .srcIn,
                ),
              ),
              suffix: IconButton(
                onPressed: onCancelClick,
                icon: Icon(Icons.close, color: Theme.of(context).splashColor),
              ),
              title: 'search'.tr(),
            ),
          ),
          SearchNews(searchText: searchText),
        ],
      ),
    );
  }
}
