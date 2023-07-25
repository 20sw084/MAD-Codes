class Person {
  String name;
  int age;
  
  Person(this.name, this.age);   //Constructor with syntactic sugar; no body required
 
 void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

class Student extends Person {
  String major;

  Student(String name, int age, this.major) : super(name, age);

  void introduce() {
    print('I am studying $major.');
  }
}

void main() {
  var student = Student('Alice', 20, "Software Engineering");
  student.sayHello();   // Inherits from Person class
  student.introduce();  // Specific to Student class
}
