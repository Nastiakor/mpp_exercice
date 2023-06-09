import 'package:flutter/material.dart';
import 'package:mpp/widgets/answer.dart';
import 'package:mpp/style.dart';

class QuizGame extends StatefulWidget {
  const QuizGame({Key? key}) : super(key: key);

  @override
  State<QuizGame> createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: contactAppBarTextStyle,
        ),
        backgroundColor: secondaryColor,
      ),
      body: Container(
        color: primaryColor,
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0) SizedBox(height: 25),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130,
              margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                  // Pass the necessary properties from answer map to your Answer widget here
                  );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              style: elevatedButtonStyle,
              onPressed: () {},
              child: Text('Question suivante'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                '0/9',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C69),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': "Qu'est-ce que l'empreinte carbone ?",
    'answers': [
      {
        'answerText': "La quantité totale d'eau consommée par une personne",
        'score': false
      },
      {
        'answerText':
            "La quantité totale de gaz à effet de serre émise par une personne",
        'score': true
      },
      {
        'answerText': "La quantité totale de déchets produits par une personne",
        'score': false
      },
    ],
  },
  {
    'question': "Qu'est-ce que la biodiversité ?",
    'answers': [
      {'answerText': "La variété des formes de vie sur Terre", 'score': true},
      {
        'answerText': "La quantité d'eau douce disponible dans le monde",
        'score': false
      },
      {
        'answerText': "La quantité de gaz à effet de serre dans l'atmosphère",
        'score': false
      },
    ],
  },
  {
    'question': "Qu'est-ce que les énergies renouvelables ?",
    'answers': [
      {
        'answerText': "Des sources d'énergie qui se renouvellent naturellement",
        'score': true
      },
      {
        'answerText':
            "Des sources d'énergie basées sur le charbon et le pétrole",
        'score': false
      },
      {
        'answerText':
            "Des sources d'énergie utilisant des combustibles fossiles",
        'score': false
      },
    ],
  },
  {
    'question': "Quels sont les effets du changement climatique ?",
    'answers': [
      {
        'answerText':
            "Élévation des températures, fonte des glaciers, événements météorologiques extrêmes",
        'score': true
      },
      {
        'answerText':
            "Augmentation de la population mondiale, épuisement des ressources naturelles",
        'score': false
      },
      {
        'answerText':
            "Dégradation des sols, diminution de la biodiversité, pollution de l'eau",
        'score': false
      },
    ],
  },
  {
    'question': "Qu'est-ce que la déforestation ?",
    'answers': [
      {
        'answerText': "La plantation d'arbres dans les zones urbaines",
        'score': false
      },
      {
        'answerText':
            "La restauration des forêts endommagées par des incendies",
        'score': false
      },
      {'answerText': "La destruction permanente des forêts", 'score': true},
    ],
  },
  {
    'question': "Qu'est-ce que l'effet de serre ?",
    'answers': [
      {
        'answerText':
            "Un processus naturel qui maintient une température favorable sur Terre",
        'score': true
      },
      {
        'answerText':
            "L'augmentation de la concentration d'ozone dans l'atmosphère",
        'score': false
      },
      {
        'answerText':
            "La dégradation de la couche d'ozone dans la stratosphère",
        'score': false
      },
    ],
  },
  {
    'question': "Quelles sont les principales sources de pollution de l'air ?",
    'answers': [
      {
        'answerText':
            "Les émissions industrielles, les véhicules, les pratiques agricoles",
        'score': true
      },
      {
        'answerText': "Les rejets chimiques provenant des océans",
        'score': false
      },
      {'answerText': "Les émissions des centrales nucléaires", 'score': false},
    ],
  },
  {
    'question': "Qu'est-ce que la surpêche ?",
    'answers': [
      {
        'answerText': "L'exploitation durable des ressources halieutiques",
        'score': false
      },
      {
        'answerText':
            "L'utilisation de techniques de pêche respectueuses de l'environnement",
        'score': false
      },
      {
        'answerText': "L'exploitation excessive des ressources halieutiques",
        'score': true
      },
    ],
  },
  {
    'question': "Quels sont les avantages des véhicules électriques ?",
    'answers': [
      {
        'answerText':
            "Réduction des émissions de gaz à effet de serre et de la pollution atmosphérique",
        'score': true
      },
      {
        'answerText':
            "Coût de fonctionnement plus élevé et dépendance aux combustibles fossiles",
        'score': false
      },
      {
        'answerText': "Moins d'autonomie par rapport aux voitures à essence",
        'score': false
      },
    ],
  },
  {
    'question':
        "Quelles actions individuelles peuvent aider à protéger l'environnement ?",
    'answers': [
      {
        'answerText':
            "Réduire la consommation d'eau et d'énergie, recycler les déchets",
        'score': true
      },
      {
        'answerText':
            "Augmenter la consommation de viande et utiliser des produits jetables",
        'score': false
      },
      {
        'answerText':
            "Utiliser des sacs en plastique à usage unique et gaspiller l'eau",
        'score': false
      },
    ],
  },
];
