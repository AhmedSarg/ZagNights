import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/validators/validators.dart';
import '../../common/widget/main_text_field.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.background,
            fit: BoxFit.cover,
            height: AppSize.infinity,
            width: AppSize.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                        child: Image.asset(ImageAssets.logoLight),
                      ),
                    ),
                    const Spacer(),
                    CustomTextField(
                      label: AppStrings.loginScreenEmailLabel.tr(),
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      validator: AppValidators.validateLogin,
                      nextFocus: _passwordFocusNode,
                    ),
                    const SizedBox(height: AppSize.s30),
                    CustomTextField(
                      label: AppStrings.loginScreenPasswordLabel.tr(),
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: true,
                      validator: AppValidators.validateLogin,
                      nextFocus: null,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: AppSize.s50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('logged in'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                        },
                        child: Text(
                          AppStrings.loginScreenLoginButton.tr(),
                          style: AppTextStyles.loginScreenLoginButtonTextStyle(
                              context),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
