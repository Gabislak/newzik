import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newzik/l10n/l10n.dart';
import 'package:newzik/Managers/locale_manager.dart';
import 'package:newzik/constants/app_colors.dart';

class LanguageListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.white10,
      leading: Icon(
        Icons.language,
        color: highEmphasisTextOnSurface,
      ),
      title: LanguagePickerWidget(),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final l10n = L10n();

    return Material(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: locale,
          // icon: Container(width: 12),
          iconEnabledColor: primaryColor,
          items: L10n.all.map(
            (locale) {
              return DropdownMenuItem(
                value: locale,
                onTap: () {
                  final provider =
                      Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(locale);
                },
                child: Text(
                  l10n.languageNames[locale.languageCode] ?? '',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              );
            },
          ).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}
