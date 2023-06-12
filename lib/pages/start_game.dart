import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpp/pages/quiz.dart';
import 'package:mpp/style.dart';

class StartGame extends StatelessWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double adaptiveTextSize(double size) {
      return screenWidth * size / 414.0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histoire de Léo le lapin',
          style: contactAppBarTextStyle.copyWith(
            fontSize: adaptiveTextSize(20),
          ),
        ),
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.08),
              // 8% of screen width as padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue les enfants ! Prêts pour une aventure écologique passionnante ? Suivez l'histoire de Léo, un lapin courageux qui vit sur une île menacée par la fonte des glaciers. Léo doit récolter des carottes pour pouvoir prendre un bateau jusqu'au continent en toute sécurité. Et devinez quoi ? Vous pouvez aider Léo en répondant correctement aux questions de notre quiz sur l'écologie ! Chaque bonne réponse vous permettra d'ajouter une carotte dans le panier de Léo. Prêts à jouer et à faire la différence pour notre cher ami Léo ? Alors, commençons le quiz et montrons à quel point nous sommes des défenseurs de l'environnement !",
                    style: TextStyle(
                      fontSize: adaptiveTextSize(16),
                      color: Color(0xFF2C2C69),
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // 2% of screen height
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Image.asset('images/rabbit_on_island.jpg',
                        height: screenWidth * 0.6), // 60% of screen width
                  ),
                  SizedBox(height: screenHeight * 0.02), // 2% of screen height
                  ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizGame(),
                        ),
                      );
                    },
                    child: Text(
                      "C'est parti !",
                      style: contactButtonTextStyle.copyWith(
                        fontSize: adaptiveTextSize(18),
                      ),
                    ), // 18 is the example font size for button text.
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
