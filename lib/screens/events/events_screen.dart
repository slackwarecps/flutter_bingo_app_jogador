
import 'package:bingojogador/models/event.dart';
import 'package:bingojogador/screens/events/card.dart';
import 'package:bingojogador/services/web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
    final User user;
    const EventsScreen({super.key, required this.user});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dev meetups v260724_1801'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
        future: getAllEvents(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          List<Widget> children = [];

          if (snapshot.hasData) {
            children = <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => CardWidget(
                    imageURL: snapshot.data![index].image,
                    title: snapshot.data![index].title,
                    description: snapshot.data![index].description
                  )
                ),
              )
            ];

          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Erro: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Buscando dados...'),
              )
            ];
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}



