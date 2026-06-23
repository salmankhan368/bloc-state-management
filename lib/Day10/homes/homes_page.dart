import 'package:flutter/material.dart';

class HomesPage extends StatefulWidget {
  const HomesPage({super.key});

  @override
  State<HomesPage> createState() => _HomesPageState();
}

class _HomesPageState extends State<HomesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Person person = Person(name: 'Salman');
          // Person person1 = Person(name: 'Salman');
          Salman salman = Salman(message: 'Hi');
          Salman _salman = Salman(message: 'Hi');
          print(salman.hashCode.toString());
          print(_salman.hashCode.toString());
          Map<String, dynamic> data = {'message': "hello salman"};
          Salman salman2 = Salman.fromJson(data);
          print(salman2.message.toString());
          Salman myStatus = Salman(message: 'i am working');
          Map<String, dynamic> mydata = myStatus.toJson();
          print(mydata.toString());

          salman = salman.copyWith(message: 'new message');
          print('new message:' + salman.message.toString());

          // print(person1 == person);
          // print(person1.hashCode.toString());
          // print(person.hashCode.toString());
        },
      ),
    );
  }
}

// class Person {
//   final String? name;
//   Person({this.name});
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Person && runtimeType == other.runtimeType && name == other.name;
//   @override
//   int get hashCode => name.hashCode;
// }

class Salman {
  String? message;
  Salman({this.message});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Salman &&
          runtimeType == other.runtimeType &&
          message == other.message;
  @override
  int get hashCode => message.hashCode;
  Salman.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    return data;
  }

  Salman copyWith({String? message}) {
    return Salman(message: message ?? this.message);
  }
}

// class Sallu {
//   final String? uni;
//   Sallu({this.uni});
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Sallu && runtimeType == other.runtimeType && uni == other.uni;
//   @override
//   int get hashCode => uni.hashCode;
// }
