import 'package:flutter/material.dart';
import 'package:rma_lv2_qouote_app/data/persons.dart';
import 'package:rma_lv2_qouote_app/models/InspiringPerson.dart';

class AddPersonScreen extends StatelessWidget {
  const AddPersonScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _quoteController = TextEditingController();
    final _birthYearController = TextEditingController();
    final _urlController = TextEditingController();
    final _descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: _quoteController,
                decoration: InputDecoration(labelText: "Quote"),
              ),
              TextField(
                controller: _birthYearController,
                decoration: InputDecoration(labelText: "Birth year"),
              ),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(labelText: "Picture url"),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              Padding(
                padding: EdgeInsets.all(100),
                child: ElevatedButton(
                  onPressed: () {
                    Persons().addPerson(
                      InspiringPerson(
                        name: _nameController.text,
                        quote: _quoteController.text,
                        birthYear: _birthYearController.text,
                        imageUrl: _urlController.text,
                        description: _descriptionController.text,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
