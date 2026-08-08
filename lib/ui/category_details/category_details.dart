import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/source_response/source_response.dart';
import 'package:news_app/ui/category_details/source/source_tapbar.dart';
import 'package:news_app/widgets/main_error.dart';
import 'package:news_app/widgets/main_waiting.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainWaiting();
        } else if (snapshot.hasError) {
          return MainError(
            onTap: () {
              ApiManager.getSources();
              setState(() {});
            },
          );
        }
        var sourcesList = snapshot.data!.sources ?? [];
        return SourceTapbar(sourceList: sourcesList);
      },
    );
  }
}
