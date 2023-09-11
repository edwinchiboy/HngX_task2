import 'package:flutter/material.dart';

class SharedTextInput extends StatefulWidget {
  const SharedTextInput(
      {Key? key,
      required this.onChanged,
      required this.validator,
      this.helperText = " ",
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.focusNode,
      this.title,
      this.onEditingComplete,
      this.maxLine = 1})
      : super(key: key);

  final Function(String) onChanged;
  final FormFieldValidator<String> validator;
  final String? helperText;
  final String? hintText;
  final String? title;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final int? maxLine;

  @override
  SharedTextInputState createState() => SharedTextInputState();
}

class SharedTextInputState extends State<SharedTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (widget.title != null)
        Text(widget.title ?? "", style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 8),
      TextFormField(
          maxLines: widget.maxLine,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              fillColor: Theme.of(context).cardColor,
              filled: true,
              hintText: widget.hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.purple)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.outline)),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey),
              )))
    ]);
  }
}
