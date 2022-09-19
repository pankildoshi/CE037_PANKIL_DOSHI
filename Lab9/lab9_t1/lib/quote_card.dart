import 'package:flutter/material.dart';
import 'package:lab8_t2/quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    Key? key,
    required this.quote,
    required this.delete,
  }) : super(key: key);

  final Quote quote;
  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote.text,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                '~ ${quote.author}',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextButton.icon(
                onPressed: delete,
                icon: const Icon(Icons.delete),
                label: const Text("Delete Quote"),
              )
            ],
          ),
        ));
  }
}
