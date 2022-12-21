import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
final String city;
final String street;
final String suite;
final String zipcode;
final String email;
final String phone;
final String usrname;

const DetailsPage({ Key? key, 
required this.city, 
required this.street, 
required this.suite, 
required this.zipcode,
required this.email,
required this.phone,
required this.usrname
}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
          Text('Username: $usrname'),
          Text('Phone Number: $phone'),
          Text('Email Address: $email'),
          Text('Address: $street, $suite\n $city, $zipcode'),
          ]
        )
      )
    );
  }
}