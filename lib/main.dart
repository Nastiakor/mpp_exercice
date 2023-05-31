import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpp/widgets/contact_button.dart';
import 'package:mpp/style.dart';
import 'package:mpp/widgets/bottom_navigation_bar.dart';
import 'package:mpp/utils/main_page_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ma Petite Planète',
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
        primaryColor: primaryColor,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(),
      body: FutureBuilder(
        future: precacheImage(
            AssetImage('images/background_homepage.png'), context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erreur lors du chargement de l\'image'),
                );
              }
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                      image: AssetImage('images/background_homepage.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                      onError: (error, stackTrace) {
                        print("L'image ne s'est pas chargée : $error");
                      }),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MyContactButton(),
                  ],
                ),
              );
          }
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
