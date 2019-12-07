import 'package:android_flutter_settings/android_flutter_settings.dart';
import 'package:flutter/material.dart';
import 'package:potato_fries/internal/methods.dart';
import 'package:potato_fries/internal/page_data.dart';
import 'package:potato_fries/pagelayout/page_layout.dart';
import 'package:potato_fries/provider/base.dart';
import 'package:potato_fries/ui/section_header.dart';
import 'package:potato_fries/ui/sizeable_list_tile.dart';

class ThemesPageLayout extends PageLayout {
  @override
  int get categoryIndex => 2;

  @override
  List<Widget> body(BuildContext context, {BaseDataProvider provider}) => [
    SectionHeader(
      title: "Colors",
    ),
    SizeableListTile(
      title: 'Accent color',
      subtitle: Text('Pick your favourite color!'),
      icon: Icon(Icons.color_lens),
      headerAncestor: "Colors",
      onTap: () => showColorPicker(
        context,
        lightnessLocked: true,
        onChange: (Color color) => bloc.changeAccent(color),
        onApply: (String dark, String light) {
          AndroidFlutterSettings.setProp(
            'persist.sys.theme.accent_dark',
            dark,
          );
          AndroidFlutterSettings.setProp(
            'persist.sys.theme.accent_light',
            light,
          );
        },
      ),
    ),
    SectionHeader(
      title: "QS panel",
    ),
  ];
}