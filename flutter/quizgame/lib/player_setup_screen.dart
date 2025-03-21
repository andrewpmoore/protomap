// ... existing imports ...
import 'package:flutter/material.dart';

// Add these imports at the top of your file
import 'dart:math';

import 'package:quizgame/quiz_screen.dart';

// ... existing code ...

class PlayerSetupScreen extends StatefulWidget {
  const PlayerSetupScreen({Key? key}) : super(key: key);

  @override
  _PlayerSetupScreenState createState() => _PlayerSetupScreenState();
}

class _PlayerSetupScreenState extends State<PlayerSetupScreen> {
  final List<Player> players = [];
  final List<String> categories = [
    'Geography',
    'History',
    'Science',
    'Pop Culture'
  ];
  String selectedCategory = 'Geography';

  void addPlayer(String name, Color color) {
    if (players.length < 4) {
      setState(() {
        players.add(Player(name: name, color: color));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Setup'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Players',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: players.length + (players.length < 4 ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < players.length) {
                    return PlayerCard(player: players[index]);
                  } else {
                    return AddPlayerCard(onAdd: addPlayer);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Select Category',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: players.length >= 2
                  ? () {
                      // Navigate to QuizScreen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                  players: players,
                                  category: selectedCategory)));
                    }
                  : null,
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class Player {
  final String name;
  final Color color;

  Player({required this.name, required this.color});
}

class PlayerCard extends StatelessWidget {
  final Player player;

  const PlayerCard({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}

class AddPlayerCard extends StatefulWidget {
  final Function(String, Color) onAdd;

  const AddPlayerCard({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddPlayerCardState createState() => _AddPlayerCardState();
}

class _AddPlayerCardState extends State<AddPlayerCard> {
  final TextEditingController _nameController = TextEditingController();
  Color _selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Player Name'),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: Colors.primaries.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: color,
                    child: _selectedColor == color
                        ? const Icon(Icons.check, size: 18, color: Colors.white)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  widget.onAdd(_nameController.text, _selectedColor);
                  _nameController.clear();
                  setState(() {
                    _selectedColor = Colors
                        .primaries[Random().nextInt(Colors.primaries.length)];
                  });
                }
              },
              child: const Text('Add Player'),
            ),
          ],
        ),
      ),
    );
  }
}
