import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/components/infodata.dart';
import 'package:rick_and_morty_app/services/locations_services.dart';

class LocationInfo extends StatelessWidget {
  LocationInfo({
    super.key,
    required this.locationUrl,
  });

  String locationUrl = '';

  @override
  Widget build(BuildContext context) {
    final locationService =
        Provider.of<LocationsServices>(context, listen: true);

    final location = locationService.getLocationByURL(locationUrl);


    return Expanded(
      child: Column(
        children: [
          InfoData(name: 'Name', value: location.name),
          InfoData(name: 'Type', value: location.type),
          InfoData(name: 'Dimension', value: location.dimension),
        ],
      ),
    );
  }
}
