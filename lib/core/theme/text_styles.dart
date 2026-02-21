import 'package:fit_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle textBold23(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 23),
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Nunito',
  );
  static TextStyle textBold20(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 20),
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Nunito',
  );
  static TextStyle textBold19(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 19),
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
    fontFamily: 'Nunito',
  );
  static TextStyle textBold13(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 13),
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Nunito',
  );
  static TextStyle textBold14(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 14),
    fontWeight: FontWeight.bold,
    color: Color(0xff3F3F3F),
    fontFamily: 'Nunito',
  );
  static TextStyle textMedium15(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 15),
    fontWeight: FontWeight.w500,
    color: Color(0xff757575),
    fontFamily: 'Nunito',
  );
  static TextStyle textMedium17(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 17),
    fontWeight: FontWeight.w500,
    color: Color(0xff3ABF38),
    fontFamily: 'Nunito',
  );
  static TextStyle textMedium14(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context: context, fontSize: 14),
    fontWeight: FontWeight.w500,
    color: Color(0xff3E3E3E),
    fontFamily: 'Nunito',
  );
}

double getResponsiveFontSize({
  required BuildContext context,
  required double fontSize,
}) {
  double scaleFactor = getScaleFactor(context: context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 1;
  double upperLimit = fontSize * 1.1;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor({required BuildContext context}) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 800) {
    return width / 550;
  } else if (width < 1250) {
    return width / 1000;
  } else {
    return width / 1500;
  }
}
