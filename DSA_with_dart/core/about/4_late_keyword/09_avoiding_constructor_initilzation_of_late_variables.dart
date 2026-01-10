void main() {
  final john = Person(Name: 'John');
  final jane = Person(Name: 'Jane');
  final family = RightImplementationeofFamily(members: [john, jane]);
  print(family.membercount);
}

class Person {
  final String Name;
  Person({required this.Name});
}

class RightImplementationeofFamily {
  final Iterable<Person> members;
  late int membercount = getMembersCount();
  RightImplementationeofFamily({required this.members});
  int getMembersCount() {
    print('getMembersCount is being called');
    return members.length;
  }
}
