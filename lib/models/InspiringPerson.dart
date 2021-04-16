import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class InspiringPerson {
  InspiringPerson({
    @required this.name,
    @required this.quote,
    @required this.birthYear,
    @required this.imageUrl,
    @required this.description,
  });

  String id = DateTime.now().toIso8601String();
  String name;
  String quote;
  String birthYear;
  String imageUrl;
  String description;
}
