import 'package:faker/faker.dart';

class UserDataFixtures {
  final Map<String, dynamic> allData = <String, dynamic>{
    'balance': 25.76,
    'userId': faker.guid.random.string(50),
    'userName': faker.person.name(),
    'docId': faker.guid.random.string(10),
    'categories': List.generate(4, (index) => faker.animal.name()),
  };

  final Map<String, dynamic> empty = <String, dynamic>{};
}
