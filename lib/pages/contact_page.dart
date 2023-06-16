import 'package:flutter/material.dart';
import 'package:mpp/style.dart';
import 'package:mpp/widgets/contact_card.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page contact',
          style: contactAppBarTextStyle,
        ),
        backgroundColor: secondaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: primaryColor,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContactCard(
                name: 'Anastasia K',
                phoneNumber: '06 00 00 00 00',
              ),
              ContactCard(
                name: 'Johan A',
                phoneNumber: '06 00 00 00 00',
              ),
              ContactCard(
                name: 'Joanne L',
                phoneNumber: '06 00 00 00 00',
              ),
              ContactCard(
                name: 'Stéfanie M',
                phoneNumber: '06 00 00 00 00',
              ),
              ContactCard(
                name: 'Karim F',
                phoneNumber: '06 00 00 00 00',
              ),
              ContactCard(
                name: 'Hugo R',
                phoneNumber: '06 00 00 00 01',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
