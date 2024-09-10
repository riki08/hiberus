import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final Widget? sufix;
  final int? maxLength;
  final Widget? prefix;
  final bool obscure;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? limit;
  final TextCapitalization capitalization;
  final TextInputType? inputType;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final String? Function(String?)? onSubmit;
  final String? Function()? onEditingComplete;
  final String? Function(PointerDownEvent?)? onTapOutside;
  final Color? fillColor;
  final int? maxLines;
  final double? fontSize;
  final EdgeInsets? contentPadding;
  final BorderSide? borderSide;
  final String? label;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.sufix,
    this.maxLength,
    this.prefix,
    this.obscure = false,
    this.fillColor = Colors.grey,
    this.limit,
    this.labelText,
    required this.capitalization,
    this.inputType,
    this.readOnly = false,
    this.focusNode,
    this.validator,
    this.maxLines = 1,
    this.onSubmit,
    this.onChange,
    this.contentPadding,
    this.fontSize,
    this.borderSide,
    this.label,
    this.onEditingComplete,
    this.onTapOutside,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        maxLength: maxLength,
        controller: textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscure,
        focusNode: focusNode,
        textCapitalization: capitalization,
        keyboardType: inputType,
        readOnly: readOnly!,
        inputFormatters: limit,
        maxLines: maxLines,
        style: TextStyle(
          color: Colors.black,
          fontWeight: fontSize != null ? FontWeight.bold : null,
          fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
        ),
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onEditingComplete: onEditingComplete,
        onTapOutside: onTapOutside,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: sufix,
          labelText: labelText,
          fillColor: fillColor,
          filled: true,
          //   labelStyle: pRegular14,
          hintText: hintText,
          contentPadding: contentPadding,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
          ),
          label: label != null ? Text(label!) : null,
          labelStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
          ),

          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: borderSide ?? BorderSide.none),
        ),
        validator: validator,
      );
}
