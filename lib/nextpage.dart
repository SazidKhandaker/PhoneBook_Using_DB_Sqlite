import 'package:day29/Database/databasehelperclass.dart';
import 'package:day29/Democlass.dart';
import 'package:day29/ModelFile/modelclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Storepage extends StatefulWidget {
  Storepage({super.key});

  @override
  State<Storepage> createState() => _StorepageState();
}

class _StorepageState extends State<Storepage> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.phone),
          title: Text("Phone add"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _namecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: Text("Enter your name"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _phonecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: Text("Enter your phone"),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () async {
                await Databaseclass.insertContact(Modelclass(
                  name: _namecontroller.text,
                  phone: _phonecontroller.text,
                ));
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) => Demo()));
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
