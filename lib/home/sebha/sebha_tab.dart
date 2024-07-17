import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  double turns = 0;

  List<String> sebha_txt = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "لا حول ولا قوة الا بالله"
  ];
  late String sebha_txt2 = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    //sebha_txt2=sebha_txt[0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedRotation(
            turns: turns,
            duration: const Duration(seconds: 1),
            child: Image.asset('assets/images/sebha.png')),
        Divider(
          color: Colors.transparent,
          thickness: 3,
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            AppLocalizations.of(context)!.sebha_txt1,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          child: Text(
            '$count',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        InkWell(
          onTap: () {
            turns += 1 / 33;
            count++;

            if (count > 33) {
              turns = 0;
              sebha_txt2 = sebha_txt[1];
            } else if (count > 66) {
              turns = 0;
              sebha_txt2 = sebha_txt[2];
            }
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            child: Text(
              '$sebha_txt2',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
