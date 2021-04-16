import 'package:flutter/material.dart';
import 'package:rma_lv2_qouote_app/data/persons.dart';
import 'package:rma_lv2_qouote_app/models/InspiringPerson.dart';
import 'package:rma_lv2_qouote_app/widgets/person_card.dart';

class PersonInfoScreen extends StatefulWidget {
  const PersonInfoScreen({Key key}) : super(key: key);

  @override
  _PersonInfoScreenState createState() => _PersonInfoScreenState();
}

class _PersonInfoScreenState extends State<PersonInfoScreen> {
  @override
  Widget build(BuildContext context) {
    var _persons = Persons().getData();

    return Container(
      height: double.infinity,
      child: ListView.builder(
        key: UniqueKey(),
        itemBuilder: (context, index) => PersonCard(_persons[index], rebuild),
        itemCount: _persons.length,
      ),
    );
  }

  void rebuild() {
    setState(() {});
  }
}
