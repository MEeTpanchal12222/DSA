

void main(List<String> args) {
  print('late fullname is being initialized');
  late final fullname = getFullName();
  final resolvedFullName = fullname;
  print('resolvedFullName =$resolvedFullName');
}
String getFullName() {
  print('getFullName is being called');
  return 'Foo Bar';
}
