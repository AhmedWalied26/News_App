import 'package:flutter/material.dart';
import 'package:news_app/api/model/source_response/source.dart';
import 'package:news_app/ui/home/category_details/news/news_card.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';

class SourceTapbar extends StatefulWidget {
  final List<Source> sourceList;

  const SourceTapbar({super.key, required this.sourceList});

  @override
  State<SourceTapbar> createState() => _SourceTapbarState();
}

class _SourceTapbarState extends State<SourceTapbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
            dividerColor: AppColors.transparentColor,
            indicatorColor: Theme.of(context).splashColor,
            isScrollable: true,
            tabAlignment: .start,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge,
            tabs: widget.sourceList.map((source) {
              return Text(source.name ?? '');
            }).toList(),
          ),
          SizedBox(height: height * 0.032),
          Expanded(
            child: TabBarView(
              children: widget.sourceList.map((source) {
                return NewsCard(source: source);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
