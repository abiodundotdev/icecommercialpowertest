import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/di.dart';

class DropDownFormField extends StatefulWidget {
  const DropDownFormField({
    Key? key,
    this.initialValue,
    required this.onChanged,
    this.onSaved,
    this.validator,
    this.enabled = true,
    this.decoration,
    required this.items,
  }) : super(key: key);
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter onChanged;
  final FormFieldSetter? onSaved;
  final bool enabled;
  final InputDecoration? decoration;
  final List<String> items;

  @override
  State<DropDownFormField> createState() => _DropDownFormFieldState();
}

class _DropDownFormFieldState extends State<DropDownFormField> {
  late TextEditingController fieldController;
  @override
  void initState() {
    super.initState();
    fieldController = TextEditingController();
    if (widget.initialValue != null) {
      fieldController.text = widget.initialValue ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: widget.validator,
          key: const ValueKey<String>("drop-down-field"),
          readOnly: true,
          decoration: widget.decoration == null
              ? null
              : widget.decoration!.copyWith(
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                ),
          enabled: widget.enabled,
          controller: fieldController,
          onTap: () async {
            final response = "";
            //await DI.get.coordinator.auth
            //     .toDropDownItems(widget.items,
            //         widget.decoration?.hintText ?? "Select an item");
            fieldController.text = response;
            widget.onChanged(response);
            if (widget.onSaved != null) {
              widget.onSaved!(response);
            }
          },
        ),
      ],
    );
  }
}
