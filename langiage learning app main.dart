import 'package:flutter/material.dart';

void main() {
  runApp(LanguageLearningApp());
}

class LanguageLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Learning App',
      theme: ThemeData(
        // Primary color for the app
        primaryColor: Color.fromRGBO(114, 35, 35, 1),
        
        // Scaffold background color
        scaffoldBackgroundColor: Color.fromRGBO(255, 149, 135, 1),
        
        // Text theme with bodyText1 defined
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(114, 35, 35, 1),
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(114, 35, 35, 1),
            fontSize: 14,
          ),
          titleLarge: TextStyle(
            color: Color.fromRGBO(114, 35, 35, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        // AppBar theme
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(255, 149, 135, 1),
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(114, 35, 35, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(114, 35, 35, 1),
          ),
          elevation: 0,
        ),
        
        // Color scheme
        colorScheme: ColorScheme.light(
          primary: Color.fromRGBO(114, 35, 35, 1),
          secondary: Color.fromRGBO(255, 149, 135, 1),
        ),
      ),
      
      // Home screen defined
      home: HomeScreen(),
    );
  }
}

// ... [rest of your existing code remains exactly the same]

class Lesson {
  final String word;
  final String translation;
  final String pronunciation;

  Lesson(this.word, this.translation, this.pronunciation);
}

final lessons = [
  Lesson('Hello & Good morning', 'Bonjour', 'bohn-zhoor'),
  Lesson('Thank you', 'Merci', 'mehr-see'),
  Lesson('Goodbye', 'Au revoir', 'oh ruh-vwahr'),
  Lesson('Please',  'S`il vous plaît', 'seel voo pleh'),
  Lesson('Yes', 'Oui', 'wee'),
  Lesson('No', 'Non', 'noh'),
  Lesson('Excuse me', 'Excusez-moi', 'ex-kew-zay mwah'),
  Lesson('I\'m sorry', 'Je suis désolé', 'zhuh swee day-zoh-lay'),
  Lesson('Good night','Bonne nuit','bun nwee'),
  Lesson('How are you?', 'Comment ça va ?', 'koh-mohn sah vah'),
  Lesson('I\'m fine', 'Ça va bien', 'sah vah byan'),
  Lesson('Excuse me', 'Excusez-moi', 'ex-kew-zay mwah'),
  Lesson('See you soon', 'À bientôt', 'ah byan-toh'),
];

class QuizQuestion {
  final String question;
  final List<String> options;
  final String answer;

  QuizQuestion(this.question, this.options, this.answer);
}

final quizQuestions = [
  QuizQuestion('How do you say "Thank you" in French?', ['Bonjour', 'Merci', 'Au revoir'], 'Merci',),
  QuizQuestion('What is the pronunciation of "Goodbye" in French?', ['bohn-zhoor', 'mehr-see', 'oh ruh-vwahr'], 'oh ruh-vwahr'),
  QuizQuestion('What is the French word for "Please"?', ['Merci', 'S\'il vous plaît', 'Au revoir'], 'S\'il vous plaît'),
  QuizQuestion('What is the French word for "Yes"?', ['Oui', 'Non', 'Merci'], 'Oui'),
  QuizQuestion('What does "Non" mean in English?', ['Yes', 'No', 'Hello'], 'No'),
  QuizQuestion('What is the French word for "Excuse me"?', ['Bonjour', 'Merci', 'Excusez-moi'], 'Excusez-moi'),
  QuizQuestion('What is the French word for "I\'m sorry"?', ['Comment ça va ?', 'Je suis désolé', 'Merci'], 'Je suis désolé'),
  QuizQuestion('What is the French word for "Good night"?', ['Bonne nuit', 'Bonsoir', 'Bonjour'], 'Bonne nuit'),
  QuizQuestion('What does "Comment ça va ?" mean in English?', ['How are you?', 'Where are you?', 'What is your name?'], 'How are you?'),
  QuizQuestion('What does "Ça va bien" mean in English?', ['I\'m fine', 'Goodbye', 'See you'], 'I\'m fine'),
  QuizQuestion('What is the French word for "See you soon"?', ['Bonne nuit', 'Au revoir', 'À bientôt'], 'À bientôt'),
  QuizQuestion('What does "Merci" mean in English?', ['Please', 'Thank you', 'Excuse me'], 'Thank you'),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    LessonScreen(),
    QuizScreen(),
    CategoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('French Language Learning App'),
        backgroundColor: Color.fromRGBO(255, 149, 135, 1),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Lessons'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(114, 35, 35, 1),
        unselectedItemColor: Color.fromRGBO(114, 35, 35, 0.6),
        onTap: _onItemTapped,
        backgroundColor: Color.fromRGBO(255, 149, 135, 1),
      ),
    );
  }
}

class LessonScreen extends StatefulWidget {
  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int currentLesson = 0;
  bool showTranslation = false;

  void nextLesson() {
    setState(() {
      showTranslation = false;
      if (currentLesson < lessons.length - 1) {
        currentLesson++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lesson Completed!'),
            backgroundColor: Color.fromRGBO(114, 35, 35, 1),
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lesson = lessons[currentLesson];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 8,
        shadowColor: Color.fromRGBO(114, 35, 35, 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Color.fromRGBO(114, 35, 35, 0.2),
            width: 1,
          ),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Word: ${lesson.word}',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(114, 35, 35, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              if (showTranslation)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Translation:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(114, 35, 35, 0.8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      lesson.translation,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(114, 35, 35, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Pronunciation:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(114, 35, 35, 0.8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      lesson.pronunciation,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(114, 35, 35, 1),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                )
              else
                Center(
                  child: ElevatedButton(
                    onPressed: () => setState(() => showTranslation = true),
                    child: Text(
                      'Show Translation',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(114, 35, 35, 1),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: nextLesson,
                  child: Text(
                    'Next Lesson',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(114, 35, 35, 1),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  bool completed = false;

  void answerQuestion(String selected) {
    final correct = quizQuestions[currentQuestion].answer;
    if (selected == correct) {
      score++;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Correct!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong!')));
    }
    setState(() {
      if (currentQuestion < quizQuestions.length - 1) {
        currentQuestion++;
      } else {
        completed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (completed) {
      return Center(
        child: Text('Quiz Completed! Score: $score/${quizQuestions.length}', 
          style: TextStyle(fontSize: 20, color: Color.fromRGBO(114, 35, 35, 1))),
      );
    }
    final q = quizQuestions[currentQuestion];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(q.question, style: TextStyle(fontSize: 20, color: Color.fromRGBO(114, 35, 35, 1))),
          SizedBox(height: 20),
          for (var option in q.options)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => answerQuestion(option),
                child: Text(option, style: TextStyle(color: Color.fromRGBO(114, 35, 35, 1))),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), backgroundColor: Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: Icon(Icons.book, color: Color.fromRGBO(114, 35, 35, 1)),
          title: Text('Vocabulary', style: TextStyle(color: Color.fromRGBO(114, 35, 35, 1))),
        ),
        ListTile(
          leading: Icon(Icons.rule, color: Color.fromRGBO(114, 35, 35, 1)),
          title: Text('Grammar', style: TextStyle(color: Color.fromRGBO(114, 35, 35, 1))),
        ),
        ListTile(
          leading: Icon(Icons.volume_up, color: Color.fromRGBO(114, 35, 35, 1)),
          title: Text('Pronunciation', style: TextStyle(color: Color.fromRGBO(114, 35, 35, 1))),
        ),
        ListTile(
          leading: Icon(Icons.text_fields, color: Color.fromRGBO(114, 35, 35, 1)),
          title: Text('Sentences', style: TextStyle(color: Color.fromRGBO(114, 35, 35, 1))),
        ),
      ],
  
    );
  }
}