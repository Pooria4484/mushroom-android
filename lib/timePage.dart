import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:mushroom/main.dart';

ValueNotifier fanOffTime = ValueNotifier<int>(0);
ValueNotifier fanOnTime = ValueNotifier<int>(0);
ValueNotifier coolerOnTime = ValueNotifier<int>(0);
ValueNotifier coolerOffTime = ValueNotifier<int>(0);
ValueNotifier coolerFastTime = ValueNotifier<int>(0);
ValueNotifier mistOnTime = ValueNotifier<int>(0);
ValueNotifier mistOffTime = ValueNotifier<int>(0);
int fanOn=0,fanOff=0,speed=0;
class TimersBody extends StatelessWidget {
  const TimersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Card(
            color: Colors.white38,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onDoubleTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                      'سیکل روشن',
                    textDirection: TextDirection.rtl,
                  ),
                  content: FanOnTimePicker(),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        print('on: $fanOn');
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'سیکل خاموش',
                              textDirection: TextDirection.rtl,
                            ),
                            content: FanOffTimePicker(),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  String buff='*#---';
                                  print('off: $fanOff');
                                  if(fanOff>9)
                                    buff+='---ftoff'+fanOff.toString();
                                  else
                                    buff+='---ftoff0'+fanOff.toString();

                                  if(fanOn>9)
                                    buff+='---fton'+fanOn.toString();
                                  else
                                    buff+='---fton0'+fanOn.toString();
                                  buff+='---@\$';
                                  print(buff);
                                  client.send(buff);
                                  Navigator.pop(context, 'OK');
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: SizedBox(
                height: 110,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'سیکل روشن:',
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            Text(
                              'سیکل خاموش:',
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 18,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ValueListenableBuilder(
                                valueListenable: fanOnTime,
                                builder: (ctx, value, child) {
                                  return Text(
                                    fanOnTime.value.toString() + ' دقیقه',
                                    style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize: 25,
                                        color: Colors.black),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: fanOffTime,
                                builder: (ctx, value, child) {
                                  return Text(
                                    fanOffTime.value.toString() + ' دقیقه',
                                    style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize: 18,
                                        color: Colors.black),
                                  );
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.lightBlueAccent,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onDoubleTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'سیکل روشن',
                  textDirection: TextDirection.rtl,
                ),
                content: FanOnTimePicker(),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      print('on: $fanOn');
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'سیکل خاموش',
                            textDirection: TextDirection.rtl,
                          ),
                          content: FanOffTimePicker(),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                String buff='*#---';
                                print('off: $fanOff');
                                if(fanOff>9)
                                  buff+='---mtoff'+fanOff.toString();
                                else
                                  buff+='---mtoff0'+fanOff.toString();

                                if(fanOn>9)
                                  buff+='---mton'+fanOn.toString();
                                else
                                  buff+='---mton0'+fanOn.toString();
                                buff+='---@\$';
                                print(buff);
                                client.send(buff);
                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
              child: SizedBox(
                height: 110,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'سیکل روشن:',
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            Text(
                              'سیکل خاموش:',
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 18,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ValueListenableBuilder(
                                valueListenable: mistOnTime,
                                builder: (ctx, value, child) {
                                  return Text(
                                    mistOnTime.value.toString() + ' دقیقه',
                                    style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize: 25,
                                        color: Colors.black),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: mistOffTime,
                                builder: (ctx, value, child) {
                                  return Text(
                                    mistOffTime.value.toString() + ' دقیقه',
                                    style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize: 18,
                                        color: Colors.black),
                                  );
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.amberAccent,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onDoubleTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'سیکل تند',
                    textDirection: TextDirection.rtl,
                  ),
                  content: SpeedTimePicker(),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        print('speed: $speed');
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'سیکل کند',
                              textDirection: TextDirection.rtl,
                            ),
                            content: FanOnTimePicker(),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'OK');
                                  print('slow: $fanOn');
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text(
                                        'سیکل خاموش',
                                        textDirection: TextDirection.rtl,
                                      ),
                                      content: FanOffTimePicker(),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'OK');
                                            String buff='*#---';
                                            print('off: $fanOff');
                                            if(fanOff>9)
                                              buff+='---ttoff'+fanOff.toString();
                                            else
                                              buff+='---ttoff0'+fanOff.toString();

                                            if(fanOn>9)
                                              buff+='---tton'+fanOn.toString();
                                            else
                                              buff+='---tton0'+fanOn.toString();

                                            if(speed>9)
                                              buff+='---ttfast'+speed.toString();
                                            else
                                              buff+='---ttfast0'+speed.toString();


                                            buff+='---@\$';
                                            print(buff);
                                            client.send(buff);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: SizedBox(
                height: 165,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'سیکل تند:',
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            Text(
                              'سیکل کند:',
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Text(
                              'سیکل خاموش:',
                              style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize: 17,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ValueListenableBuilder(
                                valueListenable: coolerFastTime,
                                builder: (ctx, value, child) {
                                  return Text(
                                    coolerFastTime.value.toString() + ' دقیقه',
                                    style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize: 25,
                                        color: Colors.black),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: coolerOnTime,
                                builder: (ctx, value, child) {
                                  return Text(
                                    coolerOnTime.value.toString() + ' دقیقه',
                                    style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize: 20,
                                        color: Colors.black),
                                  );
                                }),
                            ValueListenableBuilder(
                                valueListenable: coolerOffTime,
                                builder: (ctx, value, child) {
                                  return Text(
                                    coolerOffTime.value.toString() + ' دقیقه',
                                    style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize: 17,
                                        color: Colors.black),
                                  );
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        // children: [
        //   Divider(
        //     height: 20,
        //     thickness: 5,
        //   ),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     textDirection: TextDirection.rtl,
        //     children: [
        //       Text(
        //         'تایمر فن',
        //         style: TextStyle(
        //             fontFamily: "Vazir",
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 16),
        //         textDirection: TextDirection.rtl,
        //       )
        //     ],
        //   ),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     textDirection: TextDirection.rtl,
        //     children: [
        //       OutlinedButton(
        //         onPressed: () => showDialog<String>(
        //           context: context,
        //           builder: (BuildContext context) => AlertDialog(
        //             title: const Text('AlertDialog Title'),
        //             content: FanOnTimePicker(),
        //             actions: <Widget>[
        //               TextButton(
        //                 onPressed: () => Navigator.pop(context, 'Cancel'),
        //                 child: const Text('Cancel'),
        //               ),
        //               TextButton(
        //                 onPressed: () => Navigator.pop(context, 'OK'),
        //                 child: const Text('OK'),
        //               ),
        //             ],
        //           ),
        //         ),
        //         child: Text('خاموش'),
        //       )
        //     ],
        //   ),
        // ],
      ),
    );
  }
}

class FanOnTimePicker extends StatefulWidget {
  const FanOnTimePicker({Key? key}) : super(key: key);

  @override
  _FanOnTimePickerState createState() => _FanOnTimePickerState();
}

class _FanOnTimePickerState extends State<FanOnTimePicker> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return DurationPicker(
      duration: _duration,
      onChange: (val) {
        fanOn=val.inMinutes;
        setState(() => _duration = val);
      },
      snapToMins: 1.0,
    );
  }
}



class FanOffTimePicker extends StatefulWidget {
  const FanOffTimePicker({Key? key}) : super(key: key);

  @override
  _FanOffTimePickerState createState() => _FanOffTimePickerState();
}

class _FanOffTimePickerState extends State<FanOffTimePicker> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return DurationPicker(
      duration: _duration,
      onChange: (val) {
        fanOff=val.inMinutes;
        setState(() => _duration = val);
      },
      snapToMins: 1.0,
    );
  }
}



class SpeedTimePicker extends StatefulWidget {
  const SpeedTimePicker({Key? key}) : super(key: key);

  @override
  _SpeedTimePickerState createState() => _SpeedTimePickerState();
}

class _SpeedTimePickerState extends State<SpeedTimePicker> {
  Duration _duration = Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return DurationPicker(
      duration: _duration,
      onChange: (val) {
        speed=val.inMinutes;
        setState(() => _duration = val);
      },
      snapToMins: 1.0,
    );
  }
}



