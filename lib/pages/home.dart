import 'package:flutter/material.dart';
import 'package:peticiones_http/models/actividad.dart';
import 'package:peticiones_http/services/user_services.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ActividadModel> _actividadModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('Peticiones HTTP'),
          actions: [
            IconButton(
              onPressed: () async {
                _actividadModel.add(await UserServices().getIdeas());
                setState(() {});
              },
              splashColor: Colors.green,
              icon: Icon(
                Icons.lightbulb,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            for (var item in _actividadModel)
              ExpansionTile(
                title: Text(item.activity!),
                subtitle: Text(item.type!),
                children: [
                  ListTile(
                    title: Text(item.participants.toString()),
                    leading: Icon(Icons.people),
                  ),
                  ListTile(
                    title: Text(item.price.toString()),
                    leading: Icon(Icons.money),
                  ),
                  ListTile(
                    title: Text(item.accessibility.toString()),
                    leading: Icon(Icons.accessibility),
                  ),
                ],
              )
          ],
        ));
  }
}
