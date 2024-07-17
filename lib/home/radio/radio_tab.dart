import 'package:flutter/material.dart';
import 'package:flutter_app/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/radio_logo.png')),
        Text(
          AppLocalizations.of(context)!.radio_txt,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            Expanded(
              child: provider.isDarkMode()
                  ? Image.asset('assets/images/icon_last_dark.png')
                  : Image.asset('assets/images/icon_last.png'),
            ),
            Expanded(
              child: provider.isDarkMode()
                  ? Image.asset('assets/images/icon_play_dark.png')
                  : Image.asset('assets/images/icon_play.png'),
            ),
            Expanded(
              child: provider.isDarkMode()
                  ? Image.asset('assets/images/icon_next_dark.png')
                  : Image.asset('assets/images/icon_next.png'),
            ),
          ],
        ),
      ],
    );
  }
}
