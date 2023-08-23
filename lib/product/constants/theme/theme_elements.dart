
import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/project_colors.dart';
class ThemeElements{

  ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.disabled)) {
        return ProjectColors.inactiveGrey; // Disabled color
      }
      return ProjectColors.mainActiveColor; // Regular color
    }),
    elevation: const MaterialStatePropertyAll(0),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizingConstants.inputButtonBorderRadius))),
    foregroundColor: const MaterialStatePropertyAll(ProjectColors.pureWhite)
  ));
  ColorScheme colorScheme = ColorScheme.fromSwatch(
    accentColor: ProjectColors.mainActiveColor,
  );

}