import 'package:flutter/material.dart';
import 'package:rma_lv2_qouote_app/data/persons.dart';
import 'package:rma_lv2_qouote_app/models/InspiringPerson.dart';

class PersonCard extends StatefulWidget {
  PersonCard(this.person, this.rebuild);

  final InspiringPerson person;
  final Function rebuild;

  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        Persons().deletePerson(widget.person.id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(right: 25),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        key: Key(widget.person.id),
        leading: Image.network(widget.person.imageUrl),
        title: Text(widget.person.name + ' (' + widget.person.birthYear + ')'),
        subtitle: Text(widget.person.description),
        trailing: ElevatedButton(
          child: Icon(Icons.edit),
          onPressed: () {
            showEditMessage(context, widget.person, widget.rebuild);
          },
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (cotnext) => AlertDialog(
              title: Text(widget.person.quote),
            ),
          );
        },
      ),
    );
  }
}

void showEditMessage(
    BuildContext context, InspiringPerson person, Function rebuild) {
  final nameController = TextEditingController();
  final quoteController = TextEditingController();
  final yearController = TextEditingController();
  final urlController = TextEditingController();
  final descriptionController = TextEditingController();
  nameController.text = person.name;
  yearController.text = person.birthYear;
  quoteController.text = person.quote;
  urlController.text = person.imageUrl;
  descriptionController.text = person.description;
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: quoteController,
                  decoration: InputDecoration(labelText: 'Quote'),
                ),
                TextField(
                  controller: yearController,
                  decoration: InputDecoration(labelText: 'Birth year'),
                ),
                TextField(
                  controller: urlController,
                  decoration: InputDecoration(labelText: 'Picture url'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Persons().editPerson(
                        person.id,
                        InspiringPerson(
                            name: nameController.text,
                            quote: quoteController.text,
                            birthYear: yearController.text,
                            imageUrl: urlController.text,
                            description: descriptionController.text),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        );
      }).then((value) => rebuild());
}
