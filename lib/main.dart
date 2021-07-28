import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom/home.dart';
import 'package:mushroom/settings.dart';

Client client = Client(39810);
late Body body;

void main() {
  server();
  body = Body();
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    title: 'Navigation Basics',
    home: body,
    debugShowCheckedModeBanner: false,
  ));
}

class Client {
  late Socket socket;
  var isConnected = false;
  var port = 39810;

  Client(this.port);

  void startTCPClient() async {
    valueNotifier.value =
        Icon(Icons.wifi_protected_setup_sharp, color: Colors.red);
    try {
      socket = await Socket.connect('192.168.4.1', 39810);
      socket.write('Hello, Server!\r\n');
      socket.listen(
        (Uint8List data) {
          isConnected = true;
          final serverResponse = String.fromCharCodes(data);
          handleMessage(serverResponse);
        },
        onError: (error) {
          print(error);
          socket.destroy();
          client.socket.close();
          isConnected = false;
          valueNotifier.value =
              Icon(Icons.wifi_protected_setup_sharp, color: Colors.red);
        },
        onDone: () {
          print('Server left.');
          client.socket.close();

          //socket.destroy();
          //isConnected = false;
          //valueNotifier.value =
          //Icon(Icons.wifi_protected_setup_sharp, color: Colors.red);
        },
      );
    } catch (SocketException) {
      print(SocketException.toString());
    }
  }

  void send(data) async {
    try {
      socket.write(data + '\r\n');
    } catch (e) {
      print(e);
    }
  }

  void handleMessage(message) async {
    valueNotifier.value = Icon(Icons.wifi_outlined, color: Colors.white);
    String cmnd = message;
    if (cmnd.contains('*#') && cmnd.contains('@\$')) {
      cmnd = cmnd.substring(cmnd.indexOf('*#') + 2, cmnd.indexOf('@\$'));
      print(cmnd);
      if (cmnd.contains('tec')) {
        String buff =
            cmnd.substring(cmnd.indexOf('tec') + 3, cmnd.indexOf('tec') + 6);
        var val = int.parse(buff);
        assert(val is int);
        setTempVal(val);
      }

      if (cmnd.contains('-TSE-')) {
        if (!cmnd.contains('-TTE-')) {
          setTempSystem(0);
        } else {
          setTempSystem(1);
        }
      }

      if (cmnd.contains('-TTE-')) {
        setTempSystem(1);
      }

      if (cmnd.contains('-TSD-')) {
        if (cmnd.contains('-TTE-')) {
          setTempSystem(1);
        } else
          setTempSystem(2);
      }

      if (cmnd.contains('-HSE-')) {
        if (cmnd.contains('-MTE-'))
          setMistSystem(1);
        else
          setMistSystem(0);
      }

      if (cmnd.contains('-MTE-')) {
        setMistSystem(1);
      }

      if (cmnd.contains('-HSD-')) {
        if (cmnd.contains('-MTD-')) setMistSystem(2);
      }

      if (cmnd.contains('-FTE-')) {
        setFanSystem(0);
      }

      if (cmnd.contains('-FTD-')) {
        setFanSystem(1);
      }

      if (cmnd.contains('-TAHD-')) {
        setSensorErrHandle(1);
      }

      if (cmnd.contains('-TAHE-')) {
        setSensorErrHandle(0);
      }

      if (cmnd.contains('-ESE-')) {
        setExternalSensor(0);
      }

      if (cmnd.contains('-ESD-')) {
        setExternalSensor(1);
      }

      if (cmnd.contains('teg')) {
        String buff =
            cmnd.substring(cmnd.indexOf('teg') + 3, cmnd.indexOf('teg') + 5);
        var val = int.parse(buff);
        assert(val is int);
        setTempGoalVal(val);
      }

      if (cmnd.contains('ver')) {
        String buff =
            cmnd.substring(cmnd.indexOf('ver') + 3, cmnd.indexOf('ver') + 19);
        setVersion(buff);
      }

      if (cmnd.contains('hug')) {
        String buff =
            cmnd.substring(cmnd.indexOf('hug') + 3, cmnd.indexOf('hug') + 5);
        var val = int.parse(buff);
        assert(val is int);
        setHuGoalVal(val);
      }

      if (cmnd.contains('huc')) {
        String buff =
            cmnd.substring(cmnd.indexOf('huc') + 3, cmnd.indexOf('huc') + 6);
        var val = int.parse(buff);
        assert(val is int);
        setHuVal(val);
      }
    }
  }
}

void server() async {
  while (true) {
    await Future.delayed(const Duration(seconds: 4));
    try {
      // if (client.isConnected) {
      client.send('*#sync@\$');
      //} else {
      //  client.startTCPClient();
    } catch (e) {
      print(e);
    }
  }
}

void wifiOnClick() {
  try {
    client.startTCPClient();
  } catch (e) {
    print(e);
  }
}
