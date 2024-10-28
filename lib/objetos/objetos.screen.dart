import 'dart:convert';

import 'package:flutter/material.dart';

// class ObjectosScreen extends StatefulWidget {
//   const ObjectosScreen({super.key});

//   @override
//   State<ObjectosScreen> createState() => _ObjectosScreenState();
// }

// class _ObjectosScreenState extends State<ObjectosScreen> {
//   Map<String, dynamic> dataMap = {
//     "id": "1",
//     "name": "Jose",
//     "isActive": true,
//   };

//   String dataText = '{"id": "1","name": "Jose","isActive": true}';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               final dataJsonDecode = json.decode(dataText);
//               print(dataJsonDecode);
//             },
//             child: Text("Decode"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final dataJsonEncode = json.encode(dataMap);
//               print(dataJsonEncode);
//             },
//             child: Text("Encode"),
//           ),
//         ],
//       )),
//     );
//   }
// }

class ObjectosScreen extends StatefulWidget {
  const ObjectosScreen({super.key});

  @override
  State<ObjectosScreen> createState() => _ObjectosScreenState();
}

class _ObjectosScreenState extends State<ObjectosScreen> {
  Person person1 = Person('1', 'Joel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                final result = person1.toMap();
                // datos obtenidos del método get
                print("id de map : ${result['id']}");
                Person person2 = Person.fromMap(result);
                print("id de objeto : ${person2.id}");
              },
              child: Text("To map")),
        ],
      )),
    );
  }
}

class Person {
  String id;
  String name;

  Person(this.id, this.name);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      map['id'],
      map['name'],
    );
  }
}
