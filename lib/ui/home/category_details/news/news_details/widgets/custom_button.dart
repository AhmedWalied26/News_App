import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: .symmetric(vertical: height * 0.016),
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      ),
      onPressed: onTap,
      child: Text(
        'view_full_articel'.tr(),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
