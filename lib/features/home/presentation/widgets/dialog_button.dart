import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DialogButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
