import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom/home.dart';
import 'package:mushroom/relays.dart';
import 'package:mushroom/settings.dart';
import 'package:mushroom/timePage.dart';

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

      if(cmnd.contains('fton')){
        String buff =
        cmnd.substring(cmnd.indexOf('fton') + 4, cmnd.indexOf('fton') + 6);
        var val = int.parse(buff);
        assert(val is int);
        fanOnTime.value=val;
      }


      if(cmnd.contains('ftoff')){
        String buff =
        cmnd.substring(cmnd.indexOf('ftoff') + 5, cmnd.indexOf('ftoff') + 7);
        var val = int.parse(buff);
        assert(val is int);
        fanOffTime.value=val;
      }


      if(cmnd.contains('mton')){
        String buff =
        cmnd.substring(cmnd.indexOf('mton') + 4, cmnd.indexOf('mton') + 6);
        var val = int.parse(buff);
        assert(val is int);
        mistOnTime.value=val;
      }


      if(cmnd.contains('mtoff')){
        String buff =
        cmnd.substring(cmnd.indexOf('mtoff') + 5, cmnd.indexOf('mtoff') + 7);
        var val = int.parse(buff);
        assert(val is int);
        mistOffTime.value=val;
      }


      if(cmnd.contains('tton')){
        String buff =
        cmnd.substring(cmnd.indexOf('tton') + 4, cmnd.indexOf('tton') + 6);
        var val = int.parse(buff);
        assert(val is int);
        coolerOnTime.value=val;
      }


      if(cmnd.contains('ttfast')){
        String buff =
        cmnd.substring(cmnd.indexOf('ttfast') + 6, cmnd.indexOf('ttfast') + 8);
        var val = int.parse(buff);
        assert(val is int);
        coolerFastTime.value=val;
      }

      if(cmnd.contains('ttoff')){
        String buff =
        cmnd.substring(cmnd.indexOf('ttoff') + 5, cmnd.indexOf('ttoff') + 7);
        var val = int.parse(buff);
        assert(val is int);
        coolerOffTime.value=val;

      }
      if (cmnd.contains('RLH')){
        String buff =cmnd.substring(cmnd.indexOf('RLH'));


        if(buff[6]=='1'){
          mistRelay.value=true;
        }else{
          mistRelay.value=false;
        }


        if(buff[8]=='1'){
          fanRelay.value=true;
        }else{
          fanRelay.value=false;
        }


        if(buff[10]=='1'){
          waterRelay.value=true;
        }else{
          waterRelay.value=false;
        }

        if(buff[11]=='1'){
          motorRelay.value=true;
        }else{
          motorRelay.value=false;
        }

        if(buff[12]=='1'){
          speedRelay.value=true;
        }else{
          speedRelay.value=false;
        }


      }
      //huc458hug73tec314teg26fton10ftoff50mton10mtoff50tton10ttoff50ttfast02
      //RLH00M0F0C110
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
