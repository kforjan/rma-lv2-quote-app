import 'package:rma_lv2_qouote_app/models/InspiringPerson.dart';

class Persons {
  static final Persons _persons = Persons._internal();

  factory Persons() {
    return _persons;
  }

  var _personsData = <InspiringPerson>[
    InspiringPerson(
      name: 'Robert C. Martin',
      birthYear: '1952',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Robert_C._Martin_surrounded_by_computers.jpg/1280px-Robert_C._Martin_surrounded_by_computers.jpg',
      quote: 'Truth can only be found in one place: the code.',
      description:
          'Authored Clean Code, The Clean Coder, signatory on the Agile Manifesto, and leader of Clean Code movement.',
    ),
    InspiringPerson(
      name: 'Linus Torvalds',
      birthYear: '1969',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/01/LinuxCon_Europe_Linus_Torvalds_03_%28cropped%29.jpg',
      quote:
          'Original author and current maintainer of Linux kernel and created Git, a source code management system.',
      description:
          'Intelligence is the ability to avoid doing work, yet getting the work done.',
    ),
    InspiringPerson(
      name: 'Ada Lovelace',
      birthYear: '1815',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/0/0b/Ada_Byron_daguerreotype_by_Antoine_Claudet_1843_or_1850.jpg',
      quote:
          'That brain of mine is something more than merely mortal; as time will show.',
      description: 'The first programmer.',
    ),
  ];

  void addPerson(InspiringPerson person) {
    _personsData.add(person);
  }

  void deletePerson(String id) {
    _personsData.removeWhere((element) => element.id == id);
  }

  void editPerson(String id, InspiringPerson editedPerson) {
    var index = _personsData.indexWhere((element) => element.id == id);
    _personsData[index] = editedPerson;
  }

  List<InspiringPerson> getData() {
    return _personsData;
  }

  Persons._internal();
}
