import 'package:day29/Database/databasehelperclass.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'ModelFile/modelclass.dart';
import 'nextpage.dart';

class Demo extends StatefulWidget {
  Modelclass? mdl;
  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: FutureBuilder(
            future: Databaseclass.readdata(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Modelclass>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text("Loading data"),
                    ],
                  ),
                );
              }
              return snapshot.data!.isEmpty
                  ? Text(
                      'You dont have any data',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 21),
                    )
                  : ListView(
                      children: snapshot.data!
                          .map((e) => Center(
                                child: ListTile(
                                  title: Text(e.name),
                                  subtitle: Text(e.phone),
                                  trailing: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        await Databaseclass.Deletenode(e.id!);
                                        setState(() {});
                                      }),
                                ),
                              ))
                          .toList());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (_c) => Storepage()));
            setState(() {});
          },
          child: Center(child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
