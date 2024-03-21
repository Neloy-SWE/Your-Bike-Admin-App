/// Created by Neloy on 3/20/2024
/// Email: taufiqneloy.swe@gmail.com

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Created by Neloy on 06, August, 2023
/// Email: taufiqneloy.swe@gmail.com

class CustomTextField {
  static get({
    required BuildContext context,
    final FormFieldValidator<String>? validatorFunction,
    final List<TextInputFormatter>? inputFormatters,
    String hint = "",
    String? label,
    IconData? suffixIcon,
    Widget? suffixWidget,
    Widget? prefixWidget,
    required TextEditingController controller,
    required TextInputType textInputType,
    required TextInputAction textInputAction,
    Function()? onEditingCompleteFunction,
    void Function(String)? onChanged,
    bool secure = false,
    FocusNode? focusNode,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validatorFunction,
      obscureText: secure,
      controller: controller,
      keyboardType: textInputType,
      focusNode: focusNode,
      cursorColor: Colors.black38,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingCompleteFunction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.titleSmall,
        contentPadding: const EdgeInsets.all(10),
        alignLabelWithHint: true,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        // suffix: suffixWidget,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black54),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(7),
        ),

        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelText: label,
        labelStyle: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
