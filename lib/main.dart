

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
            title: 'Startup Name Generator',
            home: RandomWords(),
        //        appBar: AppBar(
        //          title: Text('Welcome to flutter'),
        //        ),
        //  body: Center(
           //child: Text('Hello World'),
        //    child: RandomWords(),
        //  ),
        
    
  );
  } 
}
class RandomWordsState extends State<RandomWords>{
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Startup Name Generator'),
          ),
            body: _buildSuggestions(),
            );
       // final wordPair = WordPair.random();
        //return Text(wordPair.asPascalCase);
        
      }
        final _suggestions = <WordPair>[];
        final _biggerFont = const TextStyle(fontSize: 18.0);

      Widget _buildSuggestions() {
        return ListView.builder(padding: const EdgeInsets.all(16.0),
                                itemBuilder: (context, i){
                                  if (i.isOdd) return Divider();

                                  final index = i ~/ 2;
                                  if (index >= _suggestions.length){
                                    _suggestions.addAll(generateWordPairs().take(10));
                                  }
                                  return _buildRow(_suggestions[index]);
                                });
      }
      Widget _buildRow(WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ));
      }
      
        
          
      
  }
class RandomWords extends StatefulWidget {
      @override
      RandomWordsState createState() => RandomWordsState();
    }