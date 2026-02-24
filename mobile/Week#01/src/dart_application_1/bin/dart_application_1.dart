import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;
// this code used to include code from lib (in here the file inside lib name dart_application_1.dart)

void main(List<String> arguments) {
  print('Hello world: ${dart_application_1.calculate()}!');
  // the main function of the program and used to print the result of the calculate() function
  // from the imported file

  print('Hello world: ${dart_application_1.luasSegitiga(8,6)}!');
  // this print the result of the luasSegitiga() function with parameter 8 and 6 from the imported file
}
