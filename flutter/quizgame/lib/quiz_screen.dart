import 'package:flutter/material.dart';
import 'dart:math';

import 'package:quizgame/player_setup_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<Player> players;
  final String category;

  const QuizScreen({Key? key, required this.players, required this.category})
      : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int currentPlayerIndex = 0;
  List<int> scores = [];

  @override
  void initState() {
    super.initState();
    questions = getQuestionsForCategory(widget.category);
    scores = List.filled(widget.players.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: ${widget.category}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              questions[currentQuestionIndex].text,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ...questions[currentQuestionIndex].options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => handleAnswer(option),
                  child: Text(option),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              );
            }).toList(),
            const Spacer(),
            PlayerTurnIndicator(
              player: widget.players[currentPlayerIndex],
              score: scores[currentPlayerIndex],
            ),
          ],
        ),
      ),
    );
  }

  void handleAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      scores[currentPlayerIndex]++;
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        currentPlayerIndex = (currentPlayerIndex + 1) % widget.players.length;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            players: widget.players,
            scores: scores,
          ),
        ),
      );
    }
  }
}

class PlayerTurnIndicator extends StatelessWidget {
  final Player player;
  final int score;

  const PlayerTurnIndicator(
      {Key? key, required this.player, required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: player.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: player.color,
                child: Text(
                  player.name[0].toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                player.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Text(
            'Score: $score',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String correctAnswer;

  Question(
      {required this.text, required this.options, required this.correctAnswer});
}

List<Question> getQuestionsForCategory(String category) {
  // Replace this with actual questions for each category
  return [
    Question(
      text: 'Which are the four tallest mountains in the world?',
      options: [
        'Everest, K2, Kangchenjunga, Lhotse',
        'Everest, K2, Makalu, Cho Oyu',
        'K2, Everest, Annapurna, Nanga Parbat',
        'Everest, Kilimanjaro, Mont Blanc, Denali'
      ],
      correctAnswer: 'Everest, K2, Kangchenjunga, Lhotse',
    ),
    // Add more questions for each category
  ];
}

class ResultsScreen extends StatelessWidget {
  final List<Player> players;
  final List<int> scores;

  const ResultsScreen({Key? key, required this.players, required this.scores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<Player, int>> sortedResults = List.generate(
      players.length,
      (index) => MapEntry(players[index], scores[index]),
    )..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Final Scores',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: sortedResults.length,
                itemBuilder: (context, index) {
                  final player = sortedResults[index].key;
                  final score = sortedResults[index].value;
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: player.color,
                        child: Text(
                          player.name[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(player.name),
                      trailing: Text(
                        'Score: $score',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
