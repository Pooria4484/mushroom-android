import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom/home.dart';
Client client=Client(39810);
late Body body;
void main(){
  server();
  body=Body();
  runApp(body);
}


class Client{
  late Socket socket;
  var isConnected=false;
  var port=39810;
  Client(this.port);


  void startTCPClient() async {
    valueNotifier.value=Icon(Icons.wifi_protected_setup_sharp,color: Colors.red);
    socket = await Socket.connect('192.168.4.1', this.port);
    socket.write('Hello, Server!\r\n');
    socket.listen(
          (Uint8List data) {
            isConnected=true;
        final serverResponse = String.fromCharCodes(data);
        handleMessage(serverResponse);
      },

      onError: (error) {
        print(error);
        socket.destroy();
        isConnected=false;
        valueNotifier.value=Icon(Icons.wifi_protected_setup_sharp,color: Colors.red);
      },

      onDone: () {
        print('Server left.');
        socket.destroy();
        isConnected=false;
        valueNotifier.value=Icon(Icons.wifi_protected_setup_sharp,color: Colors.red);
      },
    );
  }

  void send(data)async{
    try{
      socket.write(data+'\r\n');
    }catch(e){

    }
  }

  void handleMessage(message) async {
    valueNotifier.value=Icon(Icons.wifi_outlined,color: Colors.white);
    String cmnd=message;
    if(cmnd.contains('*#')&&cmnd.contains('@\$')){
      cmnd=cmnd.substring(cmnd.indexOf('*#')+2,cmnd.indexOf('@\$'));
      print(cmnd);
      if(cmnd.contains('tec')){
        String buff=cmnd.substring(cmnd.indexOf('tec')+3,cmnd.indexOf('tec')+6);
        var val = int.parse(buff);
        assert(val is int);
        setTempVal(val);
      }

      if(cmnd.contains('teg')){
        String buff=cmnd.substring(cmnd.indexOf('teg')+3,cmnd.indexOf('teg')+5);
        var val = int.parse(buff);
        assert(val is int);
        setTempGoalVal(val);
      }
    }
    print(message);

  }


}

void server()async{
  while(true){
    await Future.delayed(const Duration(seconds:4));
    try{
      if(client.isConnected)
        {
          client.send('*#sync@\$');
        }else{
        client.startTCPClient();
      }
    }catch(e){
      print(e);
    }
  }


}


void wifiOnClick(){
  client.socket.destroy();
  client.startTCPClient();
}
