import 'package:flutter/material.dart';
import 'package:news_app/api/model/source_response/source.dart';
import 'package:news_app/ui/category_details/news/news_card.dart';
import 'package:news_app/utils/app_colors.dart';

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
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
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
