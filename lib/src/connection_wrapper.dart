import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sahla_dz/constants.dart';
import 'package:sahla_dz/src/website.dart';

class ConnectionWrapper extends StatefulWidget {
  const ConnectionWrapper({Key? key}) : super(key: key);
  @override
  State<ConnectionWrapper> createState() => _ConnectionWrapperState();
}

class _ConnectionWrapperState extends State<ConnectionWrapper> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = _source.values.toList()[0] ? 'online' : 'offline';
          break;
        case ConnectivityResult.wifi:
          string = _source.values.toList()[0] ? 'online' : 'offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'offline';
      }
      // 2.
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return string == "online"
        ? const SahlaDz()
        : Scaffold(
            body: Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("$iconsPath/logo-site.png"),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "You are $string",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          );
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }
}

class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;
  void initialise() async {
    ConnectivityResult result = await _networkConnectivity.checkConnectivity();
    _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('sahla-dz.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}
