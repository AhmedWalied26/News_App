import 'package:flutter/material.dart';
import 'package:news_app/api/model/source_response/source.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTapbar extends StatelessWidget {
  final List<Source> sourceList;
  const SourceTapbar({super.key, required this.sourceList});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sourceList.length,
      child: TabBar(
        overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
        dividerColor: AppColors.transparentColor,
        indicatorColor: Theme.of(context).splashColor,
        isScrollable: true,
        tabAlignment: .start,
        labelStyle: Theme.of(context).textTheme.labelLarge,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: sourceList.map((source) {
          return Text(source.name ?? '');
        }).toList(),
      ),
    );
  }
}
