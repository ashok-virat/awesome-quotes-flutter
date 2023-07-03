import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList()
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> qutoes = [
   Quote('Believe you can, and you are halfway there.','Theodore Roosevelt'),
    Quote('The only way to do great work is to love what you do.','Steve Jobs'),
    Quote('Every moment is a fresh beginning.','T.S. Eliot')
  ];

  Widget quoteTemplate({quote,delete}) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                quote.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600]
              ),
            ),
          SizedBox(height:6),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: delete,
              icon: Icon(Icons.delete,color: Colors.black),
              label: Text('delete quote',style: TextStyle(
                color: Colors.black
              ),),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Qutoes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: qutoes.map((quote)=> quoteTemplate(
            quote:quote,
            delete: (){
              setState(() {
                qutoes.remove(quote);
              });
            }
        )).toList(),
      )
    );
  }
}

