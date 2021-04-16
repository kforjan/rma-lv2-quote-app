import 'package:flutter/material.dart';
import 'package:rma_lv2_qouote_app/screens/add_person_screen.dart';

import 'screens/person_info_screen.dart';

class QuoteApp extends StatefulWidget {
  @override
  _QuoteAppState createState() => _QuoteAppState();
}

class _QuoteAppState extends State<QuoteApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qoute App',
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Quote App'),
          ),
          body: PersonInfoScreen(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => Navigator.of(context)
                .push(
                  MaterialPageRoute(builder: (context) => AddPersonScreen()),
                )
                .then((value) => setState(() {})),
          ),
        ),
      ),
    );
  }
}
