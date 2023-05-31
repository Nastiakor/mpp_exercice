# Ma petite planète

 <img src="https://github.com/Nastiakor/mpp_exercice/assets/114946987/e656c45d-d2f4-4160-9f0f-f7eaa0b1d885" width="250"> 

# Exercise in Flutter: Mise en situation – Développeuse mobile (Stage/Alternance)

This exercise is part of the application process for a mobile developer apprenticeship position. It aims to demonstrate basic operations in Flutter and mobile app development.

## Set up
- Flutter installation or the use of a tool like zapp.run
- Launching the basic Flutter "myApp" application

Comments: As I have developed a Flutter app before, I had this SDK already installed on my computer (Flutter version 3.10.2 and Dart SDK version: 3.0.2). I used the official Flutter documentation for MacOS: https://docs.flutter.dev/get-started/install/macos. 
I also had Xcode installed and the iOS simulator and the Android emulator set up. The IDE I use is Android Studio. 

## Steps
1. Create a "Page contact" button with a Flutter icon and the text "Page contact" (style is free). 

Comments: I used the ElevatedButton.icon constructor on the home page and I customized the button.
Source: Flutter documentation https://api.flutter.dev/flutter/material/ElevatedButton/ElevatedButton.icon.html. 

2. Create the second page, "Page contact". 

Comments: I have created a new class ContactPage with a basic structure. I created a new Dart file and imported it in main.dart.

3. Make sure the previously created button navigates to the "Page contact" page. 

Comments: I used the Navigator.push() method.
Source: Flutter documentation https://docs.flutter.dev/cookbook/navigation/navigation-basics

4. Create an AppBar and place a back button on the left side, using an arrow back icon. 

Comments: I changed the background color of the AppBar and placed an IconButton as the leading widget.
Source: Flutter documentation https://api.flutter.dev/flutter/material/AppBar-class.html and
https://api.flutter.dev/flutter/material/IconButton-class.html.

5. Write the title "Page Contact". 

6. In the body, create a "card contact" (container).
   - Insert a name and surname (Fontsize 18) as well as a phone number (Fontsize 14) in a centered column.
   - Apply a custom visual style to this "card". 
 
Comments: I have created a new class ContactCard that takes 2 required parameters, name and phoneNumber, the build method returns a Container; and I've added it in ContactPage. 

7. Repeat this card object vertically until it overflows the screen (wrap the container in a column). The page should be readable and scrollable. 
Comments: I decided to call the ContactCard class on ContactPage several times with different class attributes. For the moment I left them as a hard-code data but I had in mind to further stock them in a JSON file or in a database and display them with a ListView.builder constructor.
Source: https://docs.flutter.dev/cookbook/lists/long-lists.

## Optional Enhancements
- Clicking on a "card" takes us to google.fr. 

Comments: I installed the url_launcher package https://pub.dev/packages/url_launcher and I used the following tuto: 
https://drissas.com/tuto-flutter-url-launcher/
and I wrapped the Container into the Inkwell widget: https://api.flutter.dev/flutter/material/InkWell-class.html.

- Create this "card" as a widget object using a "page widget" or the "contactCard()" method (see my previous comments in section 6).

- Add an icon to copy the phone number with a small popup (toast) indicating that the number has been copied. 

Comments: I have installed the fluttertoast package https://pub.dev/packages/fluttertoast and followed the example in the official documentation.

## Style and additional information
I have set the default style as follows: 
theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
        primaryColor: Color(0xFFE7FEF6),
      ), 
      
In order to do it, I have imported google_fonts package (https://pub.dev/packages/google_fonts). 
I had the idea to use the Mozilla extensions like Fonts ninja and ColorZilla to reproduce some colors and fonts used on the website of Ma petite planète. Here are the colors I used: 0xFFE7FEF6, 0xFFEEF9FB, 0xFF59CEA8 (I took inspiration from MPP website but changed them a little). Font color: 0xFF2C2C69 used on MPP site. Fonts: Poppins and OpenSans used on MPP. 

<p float="left"> 
 <img src="https://github.com/Nastiakor/mpp_exercice/assets/114946987/5f998cba-dd74-438b-b45f-18345e10cefc" width="100" /> 
 <img src="https://github.com/Nastiakor/mpp_exercice/assets/114946987/3047470b-803b-4d95-92ad-bfe00cf27e93" width="100" /> 
</p>

I have also imported flutter_launcher_icons in order to create a customized MPP launcher icon: https://pub.dev/packages/flutter_launcher_icons.

<img src="https://github.com/Nastiakor/mpp_exercice/assets/114946987/ed2b5c3a-ed33-4979-a8e6-a91e6507bf5b" width="100"> 

I had a trouble to align it, so I found some information on https://blog.logrocket.com/create-adaptive-icons-flutter-launcher-icons/
and discovered https://icon.kitchen site that helped me a lot! I also used this video: https://www.youtube.com/watch?v=eMHbgIgJyUQ.

I've also added an image on the main page. I've noticed that there was a delay in displaying it so I wrapped it in the FutureBuilder widget.
I have also added a bottom navigation bar to harmonize the main page, however, as I only had 1 day to complete the exercice, I haven't developed any features to make it functionable.

I finally decided to refactor my code by creating several directories as follows in order to make it scalable and flexible: 
- pages (with contact_page.dart), 
- utils (with main_page_app_bar and copy_phone_number.dart),
- widgets (bottom_navigation_bar, contact_button and contact_card.dart)
- and the files main.dart and style.dart.

<img src="https://github.com/Nastiakor/mpp_exercice/assets/114946987/006b3bd0-89e1-44b7-bc69-39b6ddb3736a" width="150"> 









