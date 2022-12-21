import 'dart:convert';
import 'package:delacruz_semifinal_handson/details_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List receiveFromApi = <dynamic>[];

  Future getData()async{
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(uri);
    final decodeValue = jsonDecode(response.body) as List;
    // ignore: avoid_print
    print(response.statusCode);

    setState(() {
      receiveFromApi = decodeValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true
      ),
      body: RefreshIndicator(
        onRefresh: getData,
        child: ListView.builder(
          itemCount: receiveFromApi.length,
          itemBuilder: (context,index) {
            final getValues = receiveFromApi[index] as Map;
            final nameValue = getValues['name'] as String;
            final getUsername = getValues['username'] as String;
            final getEmail = getValues['email'] as String;
            final getPhone = getValues['phone'] as String;
            final tentaValues = getValues['company'] as Map;
            final tentativeValues = getValues['address'] as Map;
            final getCity = tentativeValues['city'] as String;
            final getStreet = tentativeValues['street'] as String;
            final getSuite = tentativeValues['suite'] as String;
            final getZip = tentativeValues['zipcode'] as String;
            final getCompany = tentaValues['name'] as String;
              return Dismissible(
                key: UniqueKey(), 
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.person_2),
                    trailing: const Icon(Icons.arrow_right),
                    title: Text('Name: $nameValue'),
                    subtitle: Text('Company Name: $getCompany'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DetailsPage(
                          usrname: getUsername,
                          phone: getPhone,
                          email: getEmail,
                          street: getStreet,
                          suite: getSuite,
                          zipcode: getZip,
                          city: getCity,
                        ); 
                      }));
                    },
                  ),
                )
              );
          }
        ), 
      ),
    );
  }
}