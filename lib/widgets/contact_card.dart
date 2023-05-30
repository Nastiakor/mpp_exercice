import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mpp/utils/toast.dart';
import 'package:mpp/style.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final Uri _url = Uri.parse('https://www.google.fr');

  ContactCard({
    required this.name,
    required this.phoneNumber,
  });

  // Method to launch url
  void _launchURL(BuildContext context) async {
    try {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Impossible de lancer l\'URL, car : ${e}.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(context),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 130,
        margin: cardMargin, // margins between cards
        padding: cardPadding,
        decoration: contactCardDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centers the content of the column
          children: [
            Text(
              name,
              style: contactNameStyle,
            ),
            IconButton(
              icon: const Icon(Icons.content_copy),
              onPressed: () {
                copyPhoneNumber(phoneNumber);
              },
            ),
            Text(
              phoneNumber,
              style: contactNumberStyle,
            ),
          ],
        ),
      ),
    );
  }
}
