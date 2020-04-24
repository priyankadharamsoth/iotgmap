import 'package:flutter/material.dart';
import 'package:myapp/services/geolacator_service.dart';
import 'package:myapp/screens/search.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final locatorService = GeolocatorService();

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
          create :(context) => locatorService.getLocation(),
          child: MaterialApp(
        title: 'Parking app',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home:Search(),
      ),
    );
    
  }
}

