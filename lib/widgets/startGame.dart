import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpp/pages/quiz.dart';
import 'package:mpp/style.dart';

class StartGame extends StatelessWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histoire de Léo le lapin',
          style: contactAppBarTextStyle,
        ),
        backgroundColor: secondaryColor,
      ),
      body: Container(
        color: primaryColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Bienvenue les enfants ! Prêts pour une aventure écologique passionnante ? Suivez l'histoire de Léo, un lapin courageux qui vit sur une île menacée par la fonte des glaciers. Léo doit récolter des carottes pour pouvoir prendre un bateau jusqu'au continent en toute sécurité. Et devinez quoi ? Vous pouvez aider Léo en répondant correctement aux questions de notre quiz sur l'écologie ! Chaque bonne réponse vous permettra d'ajouter une carotte dans le panier de Léo. Prêts à jouer et à faire la différence pour notre cher ami Léo ? Alors, commençons le quiz et montrons à quel point nous sommes des défenseurs de l'environnement !",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2C2C69),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child:
                      Image.asset('images/rabbit_on_island.jpg', height: 300),
                ),
                SizedBox(height: 10),
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
                  child: Text("C'est parti !", style: contactButtonTextStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
