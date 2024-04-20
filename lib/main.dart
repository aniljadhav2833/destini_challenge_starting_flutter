import 'package:flutter/material.dart';
import 'StoryBrain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  StoryBrain myStory = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.fill),
        ),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 15,
                  child: Center(
                    child: Text(
                      myStory.getStory(),
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(myStory.getChoice1(),
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        myStory.nextStory(1);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: myStory.buttonShouldBeVisible(),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        child: Text(myStory.getChoice2(),
                            style: TextStyle(fontSize: 20, color: Colors.red)),
                        onPressed: () {
                          setState(() {
                            myStory.nextStory(2);
                          });
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
