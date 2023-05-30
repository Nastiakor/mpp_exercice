import 'package:flutter/material.dart';
import 'package:mpp/style.dart';

class MyContactButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyContactButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.contact_page_outlined,
        color: contactButtonIconColor,
        size: 30.0,
      ),
      label: Text(
        'Page contact',
        style: contactButtonTextStyle,
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorderRadius),
        ),
      ),
    );
  }
}
