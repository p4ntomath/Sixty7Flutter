import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> instructions = [
      "Instruction 1: Do this first.",
      "Instruction 2: Then do this.",
      "Instruction 3: After that, do this.",
      "Instruction 4: Finally, finish with this."
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: instructions.length, // Number of instructions
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 69, 60, 197), // Customize the background color of the icon
                child: Text(
                  '${index + 1}', // Display the number as an icon
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
              title: Text(
                instructions[index], // Display the instruction text
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}



class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> instructions = [
      "Instruction 1: Do this first.",
      "Instruction 2: Then do this.",
      "Instruction 3: After that, do this.",
      "Instruction 4: Finally, finish with this."
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: instructions.length, // Number of instructions
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 69, 60, 197), // Customize the background color of the icon
                child: Text(
                  '${index + 1}', // Display the number as an icon
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
              title: Text(
                instructions[index], // Display the instruction text
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> instructions = [
      "Instruction 1: Do this first.",
      "Instruction 2: Then do this.",
      "Instruction 3: After that, do this.",
      "Instruction 4: Finally, finish with this."
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: instructions.length, // Number of instructions
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 69, 60, 197), // Customize the background color of the icon
                child: Text(
                  '${index + 1}', // Display the number as an icon
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
              title: Text(
                instructions[index], // Display the instruction text
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}



class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> instructions = [
      "Instruction 1: Do this first.",
      "Instruction 2: Then do this.",
      "Instruction 3: After that, do this.",
      "Instruction 4: Finally, finish with this."
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: instructions.length, // Number of instructions
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 69, 60, 197), // Customize the background color of the icon
                child: Text(
                  '${index + 1}', // Display the number as an icon
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ),
              title: Text(
                instructions[index], // Display the instruction text
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}