import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/models/place.dart';
import 'package:myapp/screens/places_service.dart';
import 'package:myapp/services/geolacator_service.dart';
import 'package:myapp/screens/search.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final locatorService = GeolocatorService();
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers :[
          FutureProvider(create :(context) => locatorService.getLocation()),
          ProxyProvider<Position,Future<List<Place>>>(
            update:(context,position,places){
              return (position != null) ? placesService.getPlaces(position.latitude,position.longitude): null;
            },
          )
      ],
        
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

