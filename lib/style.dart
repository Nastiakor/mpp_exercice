import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const primaryColor = Color(0xFFE7FEF6); // background color
const secondaryColor = Color(0xFF59CEA8);
const mainAppBarColor = Colors.white54; // appBar home page color
const contactButtonIconColor = Colors.white;

const double buttonTextFontSize = 18.0;
const double buttonBorderRadius = 20.0;

// Text Styles
final contactNameStyle = const TextStyle(fontSize: 18.0);
final contactNumberStyle = const TextStyle(fontSize: 14.0);

final contactAppBarTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
final contactButtonTextStyle = GoogleFonts.openSans(
  fontSize: 18,
  color: contactButtonIconColor,
  fontWeight: FontWeight.bold,
);

// Margin and padding of the contact card
const cardMargin = EdgeInsets.all(10.0);
const cardPadding = EdgeInsets.all(10.0);

// Box Decorations
final contactCardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 3),
    ),
  ],
);

final elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: secondaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(buttonBorderRadius),
  ),
);
