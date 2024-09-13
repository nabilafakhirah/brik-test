import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text_styles.dart';
import 'gap.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.description,
    required this.placeholder,
    this.controller,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.validator,
    this.isRequired = false,
    this.isEditable = true,
    this.inputFormatters,
  });

  final String label;
  final String? description;
  final String placeholder;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool isEditable;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Gap.vertical(5),
        Row(
          children: <Widget>[
            Text(
              label,
              style: buildTextStyle(
                fontSize: 14,
                fontColor: Colors.black,
              ),
            ),
            if (isRequired) ...<Widget>[
              const Gap.horizontal(5),
              Text(
                '*',
                style: buildTextStyle(
                  fontSize: 12,
                  fontColor: Colors.black,
                ),
              ),
            ],
          ],
        ),
        if (description?.isNotEmpty ?? false) ...<Widget>[
          const Gap.vertical(10),
          Text(
            description ?? '',
            style: buildTextStyle(
              fontSize: 12,
              fontHeight: 1.5,
              fontColor: Colors.black12,
            ),
          ),
        ],
        const Gap.vertical(8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          enabled: isEditable,
          inputFormatters: inputFormatters,
          style: buildTextStyle(
            fontSize: 14,
            fontColor: Colors.black,
          ),
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 1, fontSize: 8),
            errorMaxLines: 2,
            hintText: placeholder,
            hintStyle: buildTextStyle(
              fontSize: 14,
              fontColor: Colors.black12,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
        const Gap.vertical(5),
      ],
    );
  }
}