import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormProduct extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? textWidth;
  final double? textHeigth;
  final double? width;
  final double? heigth;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isObscureText;
  final bool? isEnableSugestions;
  final bool? isEnableAutoCorrect;
  final BoxConstraints? constraints;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;

  const TextFormProduct(
      {Key? key,
      this.title,
      this.width,
      this.heigth,
      this.keyboardType,
      this.onSaved,
      this.isObscureText,
      this.isEnableSugestions,
      this.isEnableAutoCorrect,
      this.validator,
      this.inputFormatter,
      this.textWidth,
      this.textHeigth,
      this.constraints,
      this.hintText,
      this.hintStyle,
      this.suffixIcon,
      this.textEditingController, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 3),
            child: Container(
                constraints: const BoxConstraints(minHeight: 15),
                width: textWidth,
                height: textHeigth,
                child: Text(
                  title ?? '',
                  style:   TextStyle(
                      color: Colors.grey[600],
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400),
                )),
          ),
          Container(
            width: width ?? double.infinity,
            height: heigth ?? 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextFormField(
                initialValue: initialValue,
                controller: textEditingController,
                inputFormatters: inputFormatter,
                validator: validator,
                obscureText: isObscureText ?? false,
                enableSuggestions: isEnableSugestions ?? true,
                autocorrect: isEnableAutoCorrect ?? true,
                onSaved: onSaved,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  contentPadding: const EdgeInsets.fromLTRB(5, 5, 5, 8),
                  hintText: hintText,
                  hintStyle: hintStyle,
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
