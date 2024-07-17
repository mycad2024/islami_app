import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/home/hadeth/hadeth_tab.dart';
import 'package:flutter_app/home/hadeth/item_hadeth_details.dart';
import 'package:flutter_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset('assets/images/main_background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill)
            : Image.asset('assets/images/main_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .07,
              vertical: MediaQuery.of(context).size.height * .04,
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .03),
            decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? AppColors.primaryDarkColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemHadethDetails(content: args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ),
        ),
      ],
    );
  }
}
