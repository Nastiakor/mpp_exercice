import 'package:flutter/material.dart';
import 'package:mpp/style.dart';
import 'package:mpp/pages/contact_page.dart';

class MyContactButton extends StatelessWidget {
  const MyContactButton({Key? key}) : super(key: key);

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
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactPage(),
            ));
      },
      style: elevatedButtonStyle,
    );
  }
}
