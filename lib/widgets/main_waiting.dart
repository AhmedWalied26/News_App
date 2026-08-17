import 'package:flutter/material.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/size_utils.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MainWaiting extends StatelessWidget {
  const MainWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: height * 0.016),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: themeProvider.appTheme == .dark
              ? Colors.grey.shade800
              : Colors.grey.shade400,
          highlightColor: themeProvider.appTheme == .dark
              ? Colors.grey.shade700
              : Colors.grey.shade300,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.035),
            padding: EdgeInsets.all(width * 0.016),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: height * 0.22,
                    width: double.infinity,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  height: height * 0.018,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height * 0.014,
                      width: width * 0.2545,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      height: height * 0.014,
                      width: width * 0.2036,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
