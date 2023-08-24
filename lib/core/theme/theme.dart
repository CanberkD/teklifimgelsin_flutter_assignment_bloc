import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/project_colors.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/theme_elements.dart';

class ProjectTheme{
  late final ProjectThemeMode themeMode;
  late final ThemeData themeData;
  
  ProjectTheme({ProjectThemeMode? themeMode}){
    this.themeMode = themeMode ?? ProjectThemeMode.light;

    ThemeElements themeElements = ThemeElements();

    switch(this.themeMode){
  
      case ProjectThemeMode.dark:
        themeData = ThemeData(
          primaryColor: ProjectColors.mainActiveColor,
          elevatedButtonTheme: themeElements.elevatedButtonThemeData,
        );
        break;
      
      case ProjectThemeMode.light:
        themeData = ThemeData.light().copyWith(
          primaryColor: ProjectColors.mainActiveColor, 
          colorScheme: themeElements.colorScheme,
          elevatedButtonTheme: themeElements.elevatedButtonThemeData,
          scaffoldBackgroundColor: ProjectColors.mainWhite,
          progressIndicatorTheme: ProgressIndicatorThemeData(color: ProjectColors.mainActiveColor,linearTrackColor: ProjectColors.inactiveGrey.withOpacity(0.3), linearMinHeight: 8),
        );
        break;
    }

  }
  
}

enum ProjectThemeMode{
  light,
  dark
} 