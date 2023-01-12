import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.isPassword,
    this.isLabelOnly,
    this.isRequired = false,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? isPassword;
  final bool? isLabelOnly;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            textInputAction: textInputAction,
            obscureText: isPassword ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (isRequired!) {
                if (value!.isEmpty) {
                  return 'Field ini tidak boleh kosong';
                }

                if (keyboardType == TextInputType.emailAddress) {
                  if (!GetUtils.isEmail(value)) {
                    return 'Email tidak valid';
                  }
                }

                if (keyboardType == TextInputType.url) {
                  if (!GetUtils.isURL(value)) {
                    return 'URL tidak valid';
                  }
                }

                if (keyboardType == TextInputType.datetime) {
                  if (!GetUtils.isDateTime(value)) {
                    return 'Tanggal tidak valid';
                  }
                }

                if (keyboardType == TextInputType.visiblePassword) {
                  if (!GetUtils.isLengthGreaterThan(value, 6)) {
                    return 'Password harus lebih dari 6 karakter';
                  }
                }

                if (keyboardType == TextInputType.text) {
                  if (!GetUtils.isLengthGreaterThan(value, 3)) {
                    return 'Karakter harus lebih dari 3';
                  }
                }
              }

              return null;
            },
            decoration: InputDecoration(
              hintText: isLabelOnly == true ? null : hintText,
              fillColor: Colors.white,
              filled: true,
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
