import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;

  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      '$content (${index + 1})',
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: provider.isDarkMode()
                ? AppColors.yellowColor
                : AppColors.blackColor,
          ),
    );
  }
}
