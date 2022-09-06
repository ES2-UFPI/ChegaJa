import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationDeliveryman extends StatefulWidget {
  const LocationDeliveryman({Key? key}) : super(key: key);

  @override
  State<LocationDeliveryman> createState() => _LocationDeliverymanState();
}

class _LocationDeliverymanState extends State<LocationDeliveryman> {
  final Location location = Location();

  Future<void> _showInfoDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Demo Application'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Created by Guillaume Bernos'),
                InkWell(
                  child: const Text(
                    'https://github.com/Lyokone/flutterlocation',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () =>
                      launch('https://github.com/Lyokone/flutterlocation'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello!"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showInfoDialog,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              // PermissionStatusWidget(),
              // Divider(height: 32),
              // ServiceEnabledWidget(),
              // Divider(height: 32),
              // GetLocationWidget(),
              // Divider(height: 32),
              // ListenLocationWidget(),
              // Divider(height: 32),
              // ChangeSettings(),
              // Divider(height: 32),
              // EnableInBackgroundWidget(),
              // Divider(height: 32),
              // ChangeNotificationWidget()
            ],
          ),
        ),
      ),
    );
  }
}
