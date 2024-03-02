import 'package:flutter/material.dart';
import 'package:zag_nights/app/extensions.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'langauge_manager.dart';
import 'styles_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  //base
  static TextStyle baseStatesMessageTextStyle(BuildContext? context) =>
      getBoldStyle(
        fontFamily: FontConstants.english,
        color: ColorManager.primary,
        fontSize: FontSize.f16,
      );

  static TextStyle baseStatesElevatedBtnTextStyle(BuildContext? context) =>
      getBoldStyle(
        fontFamily: FontConstants.english,
        color: ColorManager.white,
        fontSize: FontSize.f14,
      );

  //Selection Screen
  static TextStyle selectionScreenLoginButtonTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

  static TextStyle selectionScreenRegisterButtonTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

  //Login Screen
  static TextStyle loginTextFieldValueTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f18,
      );

  static TextStyle loginTextFieldLabelTextStyle(BuildContext? context) =>
      getMediumStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f18,
      );

  static TextStyle loginScreenLoginButtonTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

}
