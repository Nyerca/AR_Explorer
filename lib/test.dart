import "dart:io";

main() {
  stdout.writeln("what's you name?");
  String name = stdin.readLineSync();
  print("Name: " + name);

  var n;
  int number;

  // Se n ha una proprietà num
  number = n?.num ?? 0;
  print(number);
  print(number ??=100);
  print(number);

  if(number is int) {
    print("è int");
  }
  
  var numbers= [1,2,3];
  numbers.forEach( (n) => print(n));

  sum(num2:2,num1:3);
  sum2(3);
}

dynamic sum({var num1, var num2}) => num1+num2;
dynamic sum2(var num1, {var num2}) => num1+num2;

class Person {
  String name;
  int age;

  Person(String name, [int age=15]) {
    this.name = name;
    this.age = age;
  }
  
}