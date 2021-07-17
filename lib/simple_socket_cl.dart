import 'dart:io';

void main(){
  Socket.connect('192.168.4.1', 39810).then((socket) {
    socket.write('Hello, World!\r\n');
  });
}