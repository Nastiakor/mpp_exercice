import 'package:flutter/material.dart';
import 'package:mpp/utils/didIwin_didIlose.dart';
import 'package:mpp/widgets/answer.dart';
import 'package:mpp/style.dart';

class QuizGame extends StatefulWidget {
  const QuizGame({Key? key}) : super(key: key);

  @override
  State<QuizGame> createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {
  List<Widget> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }

      double screenWidth = MediaQuery.of(context).size.width;

      int numberOfImagesInARow = 10;

      double imageWidthPercentage = 1.0 / numberOfImagesInARow;
      double imageWidth = screenWidth * imageWidthPercentage;

      // adding to the score tracker on top
      _scoreTracker.add(
        Image.asset(
          answerScore ? "images/carrot.png" : "images/eaten_carrot.png",
          width: imageWidth,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  void _nextQuestion() {
    if (_questionIndex + 1 < _questions.length) {
      setState(() {
        _questionIndex++;
        answerSelected = false;
        correctAnswerSelected = false;
      });
    } else if (_questionIndex + 1 == _questions.length) {
      setState(() {
        endOfQuiz = true;
      });
    }
    if (answerSelected && _totalScore >= 5) {
      Future.delayed(Duration.zero, () => didIwin(context, _totalScore));
    } else if (answerSelected && _totalScore < 5) {
      Future.delayed(Duration.zero, () => didIlose(context, _totalScore));
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
      correctAnswerSelected = false;
      answerSelected = false;
    });
  }

  double adaptiveTextSize(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * size / 414.0;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: contactAppBarTextStyle.copyWith(
            fontSize: adaptiveTextSize(context, 20),
          ),
        ),
        backgroundColor: secondaryColor,
      ),
      body: Container(
        color: primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  if (_scoreTracker.length == 0)
                    SizedBox(height: screenHeight * 0.05),
                  if (_scoreTracker.length > 0) ..._scoreTracker
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                width: double.infinity,
                height: screenHeight * 0.2,
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.08, // 8% of screen width
                  vertical: screenHeight * 0.02, // 2% of screen height
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.12, // 12% of screen width
                  vertical: screenHeight * 0.02, // 2% of screen height
                ),
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
                        fontSize: adaptiveTextSize(context, 18),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ...(_questions[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) {
                return Answer(
                  answerText: answer['answerText'].toString(),
                  answerColor: answerSelected
                      ? answer['score'] == true
                          ? Color(0xFF30CE9B)
                          : Color(0xFFFFA29D)
                      : null,
                  answerTap: () {
                    // if answer was already selected then nothing happens onTap
                    if (answerSelected) {
                      return;
                    }
                    // answer is being selected
                    _questionAnswered(answer['score'] as bool);
                  },
                );
              }).toList(),
              SizedBox(height: 20),
              endOfQuiz == false
                  ? ElevatedButton(
                      style: elevatedButtonStyle,
                      onPressed: () {
                        if (!answerSelected) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Tu dois choisir une réponse avant de passer à la question suivante'),
                            ),
                          );
                          return;
                        }
                        _nextQuestion();
                      },
                      child: Text('Question suivante'),
                    )
                  : ElevatedButton(
                      style: elevatedButtonStyle,
                      onPressed: () {
                        if (!answerSelected) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Tu dois choisir une réponse avant de passer à la question suivante'),
                            ),
                          );
                          return;
                        }
                        _resetQuiz();
                      },
                      child: Text('Recommencer le quiz'),
                    ),
              Container(
                color: primaryColor,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    // 5% de la largeur de l'écran
                    vertical:
                        screenHeight * 0.01), // 1% de la hauteur de l'écran
                /* child: Text(
                    '${_totalScore.toString()}/${_questions.length}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C69),
                    ),
                  ),*/
              ),
              if (answerSelected && !endOfQuiz)
                Container(
                  constraints: BoxConstraints(maxHeight: screenHeight * 0.08),
                  margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                  width: double.infinity,
                  color: correctAnswerSelected
                      ? Color(0xFF30CE9B)
                      : Color(0xFFFFA29D),
                  child: Center(
                    child: Text(
                      correctAnswerSelected
                          ? "Bravo, c'est correct ! "
                          : "Faux :(",
                      style: TextStyle(
                        fontSize: adaptiveTextSize(context, 18),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question':
        "Quel est le meilleur moyen de se déplacer pour aller à l'école ?",
    'answers': [
      {'answerText': "Prendre la voiture tous les jours", 'score': false},
      {'answerText': "Marcher ou faire du vélo", 'score': true},
      {
        'answerText': "Demander à maman ou papa de nous déposer en voiture",
        'score': false
      },
    ],
  },
  {
    'question': "Qu'est-ce qui est le mieux pour l'environnement ?",
    'answers': [
      {'answerText': "Prendre un bain tous les jours", 'score': false},
      {'answerText': "Prendre une douche courte", 'score': true},
      {'answerText': "Remplir la baignoire pour jouer", 'score': false},
    ],
  },
  {
    'question': "Qu'est-ce qui est le mieux pour la planète ?",
    'answers': [
      {'answerText': "Jeter les déchets par terre", 'score': false},
      {'answerText': "Les mettre dans une poubelle", 'score': true},
      {'answerText': "Les brûler dans le jardin", 'score': false},
    ],
  },
  {
    'question': "Qu'est-ce qui aide à économiser l'énergie ?",
    'answers': [
      {
        'answerText': "Laisser les lumières allumées toute la journée",
        'score': false
      },
      {'answerText': "Utiliser des ampoules énergétiques", 'score': false},
      {
        'answerText': "Éteindre les lumières en sortant d'une pièce",
        'score': true
      },
    ],
  },
  {
    'question':
        "Quand on jette un plastique, combien de temps met-il pour se décomposer ?",
    'answers': [
      {'answerText': "Quelques heures", 'score': false},
      {'answerText': "Plusieurs centaines d'années", 'score': true},
      {'answerText': "Quelques mois", 'score': false},
    ],
  },
  {
    'question': "Qu'est-ce qui aide à économiser l'eau ?",
    'answers': [
      {
        'answerText': "Laisser le robinet ouvert en se brossant les dents",
        'score': false
      },
      {
        'answerText': "Fermer le robinet pendant le brossage des dents",
        'score': true
      },
      {'answerText': "Prendre un bain tous les jours", 'score': false},
    ],
  },
  {
    'question': "Qu'est-ce qui est préférable pour réduire les déchets ?",
    'answers': [
      {
        'answerText': "Utiliser des sacs en plastique à usage unique",
        'score': false
      },
      {'answerText': "Utiliser des sacs réutilisables en tissu", 'score': true},
      {'answerText': "Jeter les déchets par terre", 'score': false},
    ],
  },
  {
    'question': "Qu'est-ce qui est mieux pour protéger les océans ?",
    'answers': [
      {'answerText': "Ignorer les déchets sur la plage", 'score': false},
      {'answerText': "Jeter les déchets dans la mer", 'score': false},
      {'answerText': "Ramasser les déchets sur la plage", 'score': true},
    ],
  },
  {
    'question': "Comment pouvons-nous aider les animaux de la forêt ?",
    'answers': [
      {
        'answerText': "En respectant leur habitat et en ne les dérangeant pas",
        'score': true
      },
      {
        'answerText':
            "En jetant nos déchets par terre pour qu'ils aient à manger",
        'score': false
      },
      {
        'answerText': "En leur construisant des maisons en plastique",
        'score': false
      },
    ],
  },
  {
    'question':
        "Que pouvons-nous faire pour aider les plantes et les arbres à grandir ?",
    'answers': [
      {'answerText': "Les arroser régulièrement", 'score': true},
      {'answerText': "Marcher dessus pour les aider à pousser", 'score': false},
      {'answerText': "Les couper avec des ciseaux", 'score': false},
    ],
  },
];
