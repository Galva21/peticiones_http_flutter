import 'package:flutter/material.dart';
import 'package:peticiones_http/models/actividad.dart';
import 'package:peticiones_http/services/user_services.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ActividadModel> _actividadModel = [];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Peticiones HTTP',
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                loading = true;
                setState(() {});
                _actividadModel.insert(0, await UserServices().getIdeas());
                loading = false;
                setState(() {});
              },
              splashColor: Colors.green[200],
              icon: Icon(
                Icons.lightbulb,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        body: _actividadModel.isEmpty
            ? Center(child: Text('No hay ideas'))
            : ListView(
                children: [
                  if (loading)
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  for (var item in _actividadModel)
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ExpansionTile(
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
                      ),
                    )
                ],
              ));
  }
}
