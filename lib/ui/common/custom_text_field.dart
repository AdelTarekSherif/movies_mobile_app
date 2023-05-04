import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';
import 'package:movies_mobile_app/ui/style/app.dimens.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String? hint;
  final TextInputType? textInputType;
  final Function? onSave;
  final Function? onDoneTapped;
  final Function? onChanged;
  final Function? validator;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final bool isRequired;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final String? initialValue;
  final Color? backgroundColor;
  final TextStyle? style;
  final InputDecoration? inputDecoration;
  final double? contentTopPadding;
  final double? contentBottomPadding;
  final InputBorder? focusedBorder;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Color fillColor;
  final int minLines;
  final int maxLines;
  final double cornerRadius;
  final double elevation;
  final double vertMargin;

  const CustomTextField({
    this.title = '',
    this.hint,
    this.textInputType,
    this.onSave,
    this.onDoneTapped,
    this.validator,
    this.textEditingController,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.isRequired = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.initialValue,
    this.fillColor = Colors.white,
    this.minLines = 1,
    this.maxLines = 1,
    this.cornerRadius = 10,
    this.elevation = 0,
    this.backgroundColor,
    this.style,
    this.onChanged,
    this.inputDecoration,
    this.contentTopPadding = 16,
    this.contentBottomPadding = 16,
    this.focusedBorder,
    this.vertMargin = AppDimens.marginDefault8,
    this.inputFormatters,
    this.maxLength,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.vertMargin),
      child: Material(
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          elevation: widget.elevation,
          shadowColor: Colors.black.withOpacity(0.4),
          color: widget.backgroundColor,
          child: TextFormField(
            key: Key(widget.title),
            focusNode: widget.focusNode,
            controller: widget.textEditingController,
            initialValue: widget.initialValue,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged != null ? (value) => widget.onChanged!(value) : (value) {},
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            keyboardType: widget.textInputType ?? TextInputType.text,
            validator: widget.validator != null
                ? (value) => widget.validator!(value)
                : (value) {
              if (widget.isRequired) {
                if (value == null || value.isEmpty) {
                  return "    Data is Required   ";
                }
                return null;
              } else {
                return null;
              }
            },
            onSaved: widget.onSave != null ? (value) => widget.onSave!(value) : (value) {},
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            style: widget.style ??
                Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            textInputAction:
            widget.textInputAction ?? (widget.nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
            onEditingComplete: () {
              if (widget.focusNode != null) widget.focusNode!.unfocus();

              widget.onDoneTapped ??
                      () {
                    try {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                        currentFocus.focusedChild!.unfocus();
                      }
                    } catch (e) {
                      debugPrint('Error in (onDoneTapped)FormField: $e');
                    }
                  };
            },
            onFieldSubmitted: (term) {
              if (widget.focusNode != null) widget.focusNode!.unfocus();
              if (widget.nextFocusNode != null) FocusScope.of(context).requestFocus(widget.nextFocusNode);
            },
            decoration: widget.inputDecoration ??
                InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isCollapsed: true,
                  filled: true,
                  fillColor: widget.fillColor,
                  labelText: widget.title,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  counterText: '',
                  labelStyle: widget.labelStyle ??
                      Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black.withOpacity(0.4)),
                  contentPadding: EdgeInsets.only(
                      left: 14.0,
                      right: 14,
                      top: widget.contentTopPadding != null
                          ? widget.contentTopPadding!
                          : widget.prefixIcon != null
                          ? 18
                          : 14,
                      bottom: widget.contentTopPadding != null ? widget.contentTopPadding! : 14),
                  focusedBorder: widget.focusedBorder ??
                      OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(widget.cornerRadius),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFDADADA), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.withOpacity(0.6)),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
                ),
          )),
    );
  }
}