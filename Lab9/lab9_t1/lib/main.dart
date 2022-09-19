import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quote App",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const Echolist(),
    );
  }
}

class Echolist extends StatefulWidget {
  const Echolist({Key? key}) : super(key: key);

  @override
  _EcholistState createState() => _EcholistState();
}

class _EcholistState extends State<Echolist> {
  List<Quote> quotes = [
    Quote(text: "The Truth is very pure and never simple.", author: "Lynn"),
    Quote(
        text: "I see humans in world, but no humanity in world.",
        author: "Zane"),
    Quote(
        text: "The time is always right to do what is right.",
        author: "Robert"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote App"),
        centerTitle: true,
      ),
      body: Column(
        //changed quoteTemplate() with QuoteCard constructor call statement
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
