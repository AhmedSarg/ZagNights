import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.focusNode,
    this.nextFocus,
    required this.controller,
    required this.validator,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
  });

  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function()? onTap;
  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;
  bool focused = false;
  late bool hidden = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      cursorColor: ColorManager.tertiary,
      cursorWidth: AppSize.s1,
      selectionControls: CupertinoTextSelectionControls(),
      style: AppTextStyles.loginTextFieldValueTextStyle(context),
      obscureText: hidden,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: AppTextStyles.loginTextFieldLabelTextStyle(context),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    hidden = !hidden;
                  });
                },
                iconSize: AppSize.s24,
                splashRadius: AppSize.s1,
                isSelected: !hidden,
                color: ColorManager.white,
                selectedIcon: const Icon(CupertinoIcons.eye),
                icon: const Icon(CupertinoIcons.eye_slash),
              )
            : null,
      ),
    );
  }
}
