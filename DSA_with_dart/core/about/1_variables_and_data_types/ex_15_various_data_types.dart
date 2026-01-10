void main(List<String> args) {
  const int someInterger = 10;
  print(someInterger);
  const double someDouble = 3.14;
  print(someDouble);
  const String someString = 'hello';
  print(someString);
  const bool someBoolean = true;
  print(!someBoolean);
  const List<int> someList = [1, 2, 3];
  print(someList);
  const Map<String, String> someMap = {'foo': 'bar'};
  print(someMap['foo']);
  const Set<int> someSet = {1, 2, 3};
  print(someSet.length);
  const Symbol someSymbol = #someNull;
  print(someSymbol);
}
