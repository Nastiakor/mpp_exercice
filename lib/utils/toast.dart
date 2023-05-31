import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // needed for Clipboard
import 'package:fluttertoast/fluttertoast.dart';

void copyPhoneNumber(String phone) {
  Clipboard.setData(ClipboardData(text: phone));
  Fluttertoast.showToast(
    msg: 'Numéro de téléphone copié',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
  );
}
