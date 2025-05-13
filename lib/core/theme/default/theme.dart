import 'package:flutter/material.dart';
import 'package:apptours/core/theme/default/properties.dart';
import 'package:apptours/generated/assets/fonts.gen.dart';

class AppColors {
  static const light = Color(0xFFFFFFFF);
  static const light30 = Color(0x4DFFFFFF);
  static const dark = Color(0xFF011638);
  static const dark15 = Color(0x26011638);
  static const dark30 = Color(0x4D011638);
  static const grey = Color(0xFFEDF0F3);
  static const greyLight = Color(0xFFF5F6F7);

  static const buttonsGreen = Color(0xFFD5F568);
  static const iconsGreen = Color(0xFFAED42E);
  static const textGreen = Color(0xFF465512);
  static const accentGreen = Color(0xFFDDFC74);

  static const greenGradient = LinearGradient(
    colors: [buttonsGreen, iconsGreen],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const text = Color(0xFF0C0729);
  static const primary = Color(0xFF25223D);
  static const secondary = Color(0xFF555368);
  static const tertiary = Color(0xFF465512);
  static const border = Color(0xFFECEEF4);
  static const card = Color(0xFFFAFAFB);
  static const error = Color(0xFFF77349);

  static const aquamarine = Color(0xFF0EB39F);
  static const aquamarineLight = Color(0x330EB39F);
  static const green = Color(0xFF2FB30E);
  static const greenLight = Color(0x332FB30E);
  static const yellow = Color(0xFFFDD609);
  static const yellowLight = Color(0x33FDD609);
  static const red = Color(0xFFE94B19);
  static const redLight = Color(0x33E94B19);
  static const burgundy = Color(0xFFA00505);
  static const burgundyLight = Color(0x33A00505);

  static const turquoise = Color(0xFF11BFB4);
  static const purple = Color(0xFF5454E2);

  // map marker
  static const accentRed = Color(0xFFF77349);
}

class Paddings {
  static const all20 = EdgeInsets.all(20.0);
}

@immutable
class _Shapes {
  final _borderSide = const BorderSide(width: 2);

  final _borderRadius = BorderRadius.circular(10);

  late final itemShape = RoundedRectangleBorder(
    borderRadius: _borderRadius,
  );

  OutlineInputBorder inputBorder({Color? color}) => OutlineInputBorder(
        borderSide: _borderSide.copyWith(color: color ?? Colors.transparent),
        borderRadius: _borderRadius,
      );
}

@immutable
class AppTextStyles {
  static const baseTextStyle = TextStyle(
    letterSpacing: -0.3,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.sFProDisplay,
    fontStyle: FontStyle.normal,
  );
  static const height = 1.193;
  late final textStyle12 = baseTextStyle.copyWith(fontSize: 12, height: height);
  late final textStyle14 = baseTextStyle.copyWith(fontSize: 14, height: height);
  late final textStyle16 = baseTextStyle.copyWith(fontSize: 16, height: height);
  late final textStyle18 = baseTextStyle.copyWith(fontSize: 18, height: height);
  late final textStyle20 = baseTextStyle.copyWith(fontSize: 20, height: height);
  late final textStyle22 = baseTextStyle.copyWith(fontSize: 22, height: height);
  late final textStyle24 = baseTextStyle.copyWith(fontSize: 24, height: height);
  late final textStyle30 = baseTextStyle.copyWith(fontSize: 30, height: height);
  late final textStyle32 = baseTextStyle.copyWith(fontSize: 30, height: height);
  late final textStyle48 = baseTextStyle.copyWith(fontSize: 48, height: height);
  late final textStyle66 = baseTextStyle.copyWith(fontSize: 66, height: height);

  TextTheme create({required Color color}) => TextTheme(
        titleLarge: textStyle32.copyWith(color: color),
        titleMedium: textStyle30.copyWith(color: color),
        titleSmall: textStyle24.copyWith(color: color),
        bodyLarge: textStyle16.copyWith(color: color),
        bodyMedium: textStyle14.copyWith(color: color),
        bodySmall: textStyle12.copyWith(color: color),
        labelLarge: textStyle22.copyWith(color: color),
        labelMedium: textStyle20.copyWith(color: color),
        labelSmall: textStyle18.copyWith(color: color),
        //unused text styles
        // displayLarge: null,
        // displayMedium: null,
        // displaySmall: null,
        // headlineLarge: null,
        // headlineMedium: null,
        // headlineSmall: null,
      );
}

class SilkroadTheme {
  final shapes = _Shapes();
  final paddings = Paddings();
  final textStyles = AppTextStyles();

  ThemeData create() {
    final textTheme = textStyles.create(color: AppColors.dark);
    final primaryTextTheme = textStyles.create(color: AppColors.primary);

    return ThemeData(
      useMaterial3: false,
      fontFamily: FontFamily.sFProDisplay,
      primaryColor: AppColors.primary,
      canvasColor: AppColors.light,
      scaffoldBackgroundColor: AppColors.light,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.primary,
        error: AppColors.error,
        onError: AppColors.error,
        background: AppColors.light,
        onBackground: AppColors.dark15,
        secondary: AppColors.secondary,
        onSecondary: AppColors.secondary,
        surface: Colors.transparent,
        onSurface: Colors.transparent,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
      cardTheme: CardTheme(
        elevation: 0.0,
        margin: EdgeInsets.zero,
        color: AppColors.card,
        shape: shapes.itemShape,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: AppColors.light,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: shapes.inputBorder(),
        disabledBorder: shapes.inputBorder(),
        focusedBorder: shapes.inputBorder(color: AppColors.primary),
        errorBorder: shapes.inputBorder(color: AppColors.error),
        focusedErrorBorder: shapes.inputBorder(color: AppColors.error),
        errorMaxLines: 1,
        errorStyle: textTheme.labelSmall?.copyWith(
          color: AppColors.error,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: shapes.itemShape,
        titleTextStyle: textTheme.titleSmall,
        contentTextStyle: textTheme.bodySmall,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: textTheme.labelMedium!.color,
        labelStyle: textTheme.labelMedium,
        unselectedLabelStyle: textTheme.labelMedium,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: FixedStateProperty<Color>(AppColors.dark15),
        trackVisibility: FixedStateProperty<bool>(false),
        thumbVisibility: FixedStateProperty<bool>(true),
        thickness: FixedStateProperty<double>(5.3),
        crossAxisMargin: 2.6,
        mainAxisMargin: 2.6,
        radius: const Radius.circular(2.6),
        interactive: false,
      ),
      cardColor: AppColors.card,
      indicatorColor: AppColors.primary,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      textTheme: textTheme,
      primaryTextTheme: primaryTextTheme,
    );
  }
}
