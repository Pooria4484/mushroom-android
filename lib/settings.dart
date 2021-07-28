import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mushroom/main.dart';
import 'package:toggle_switch/toggle_switch.dart';

ValueNotifier tempSystem = ValueNotifier<int>(2);
ValueNotifier mistSystem = ValueNotifier<int>(2);
ValueNotifier fanSystem = ValueNotifier<int>(1);
ValueNotifier sensorErrHandle=ValueNotifier<int>(1);
ValueNotifier version=ValueNotifier<String>('2021-07-28-21-00');
ValueNotifier externalSensor=ValueNotifier<int>(1);
String ssid='',pass='';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Divider(
                  height: 20,
                  thickness: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'دما',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عملکرد :',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontSize: 14),
                      textDirection: TextDirection.rtl,
                    ),
                    ValueListenableBuilder(
                      valueListenable: tempSystem,
                      builder: (ctx, value, child) {
                        return ToggleSwitch(
                          minWidth: 80.0,
                          cornerRadius: 20.0,
                          activeBgColors: [
                            [Colors.green[800]!],
                            [Colors.blue[800]!],
                            [Colors.red[800]!]
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: tempSystem.value,
                          totalSwitches: 3,
                          labels: ['اتومات', 'تایمر', 'خاموش'],
                          radiusStyle: true,
                          icons: [
                            Icons.check_circle,
                            Icons.timer,
                            Icons.do_not_disturb_alt
                          ],
                          onToggle: (index) {
                            if (index==0) {
                              client.send('*#TSE-TTD@\$');
                            }else if(index==1){
                              client.send('*#TSD-TTE@\$');
                            }else{
                              client.send('*#TSD-TTD@\$');
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'رطوبت',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عملکرد :',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontSize: 14),
                      textDirection: TextDirection.rtl,
                    ),
                    ValueListenableBuilder(valueListenable: mistSystem, builder: (ctx, value, child){
                      return ToggleSwitch(
                        minWidth: 80.0,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [Colors.green[800]!],
                          [Colors.blue[800]!],
                          [Colors.red[800]!]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: mistSystem.value,
                        totalSwitches: 3,
                        labels: ['اتومات', 'تایمر', 'خاموش'],
                        radiusStyle: true,
                        icons: [
                          Icons.check_circle,
                          Icons.timer,
                          Icons.do_not_disturb_alt
                        ],
                        onToggle: (index) {
                          if (index==0) {
                            client.send('*#HSE-MTD@\$');
                          }else if(index==1){
                            client.send('*#HSD-MTE@\$');
                          }else{
                            client.send('*#HSD-MTD@\$');
                          }                        },
                      );
                    }),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عملکرد تایمی در صورت قطع سنسور :',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    ValueListenableBuilder(valueListenable: sensorErrHandle,
                        builder: (ctx, value, child){
                          return ToggleSwitch(
                            minWidth: 50.0,
                            cornerRadius: 20.0,
                            activeBgColors: [
                              [Colors.green[800]!],
                              [Colors.red[800]!]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: sensorErrHandle.value,
                            totalSwitches: 2,
                            //labels: ['اتومات', 'تایمر','خاموش'],
                            radiusStyle: true,
                            icons: [Icons.check_circle, Icons.do_not_disturb_alt],
                            onToggle: (index) {
                              if(index==0)
                                client.send('*#TAHE@\$');
                              else
                                client.send('*#TAHD@\$');
                            },
                          );
                        })

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'سنسور بیسیم خارجی :',
                        style: TextStyle(
                            fontFamily: "Vazir",
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      ValueListenableBuilder(valueListenable: externalSensor,
                          builder: (ctx, value, child){
                            return ToggleSwitch(
                              minWidth: 50.0,
                              cornerRadius: 20.0,
                              activeBgColors: [
                                [Colors.green[800]!],
                                [Colors.red[800]!]
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex: externalSensor.value,
                              totalSwitches: 2,
                              //labels: ['اتومات', 'تایمر','خاموش'],
                              radiusStyle: true,
                              icons: [Icons.check_circle, Icons.do_not_disturb_alt],
                              onToggle: (index) {
                                if(index==0)
                                  client.send('*#TESE@\$');
                                else
                                  client.send('*#TESD@\$');
                              },
                            );
                          })

                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'تهویه',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تایمر فن :',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontSize: 14),
                      textDirection: TextDirection.rtl,
                    ),
                    ValueListenableBuilder(valueListenable: fanSystem, builder: (ctx, value, child){
                      return ToggleSwitch(
                        minWidth: 50.0,
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [Colors.green[800]!],
                          [Colors.red[800]!]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: fanSystem.value,
                        totalSwitches: 2,
                        //labels: ['اتومات', 'تایمر','خاموش'],
                        radiusStyle: true,
                        icons: [Icons.check_circle, Icons.do_not_disturb_alt],
                        onToggle: (index) {
                          if(index==0){
                            client.send('*#FTE@\$');
                          }else{
                            client.send('*#FTD@\$');
                          }
                        },
                      );
                    })

                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'تنظیمات اتصال دستگاه',
                      style: TextStyle(
                          fontFamily: "Vazir",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: TextFormField(
                      onChanged: (str){
                        ssid=str;

                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.wifi_tethering),
                        //hintText: 'What do people call you?',
                        labelText: 'SSID',
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      onChanged: (str){
                        pass=str;

                      },
                      textAlign: TextAlign.center,
                      obscuringCharacter: "*",
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.signal_wifi_4_bar_lock),
                        //hintText: 'What do people call you?',
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                      heroTag: "btn2",
                      onPressed: (){
                        client.send('*#STASSID'+ssid+"PASS"+pass+"END@\$\r\n");
                        print('*#STASSID'+ssid+"PASS"+pass+"END@\$\r\n");
                      },
                      label: Text(
                        'ارسال',
                        style: TextStyle(fontFamily: "Vazir"),
                      )),
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                ),
                ValueListenableBuilder(valueListenable: version, builder: (ctx,value,child){
                  return Text(
                    'نسخه برنامه:' + version.value,
                    style: TextStyle(fontFamily: 'Vazir'),
                    textDirection: TextDirection.rtl,
                  );
                })
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                      heroTag: "btn1",
                      onPressed: (){
                        client.send('*#UPDATE@\$');
                      },
                      label: Text(
                        'بروزرسانی دستگاه',
                        style: TextStyle(fontFamily: "Vazir"),
                      )),
                ),
              ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

void setMistSystem(int t) {
  mistSystem.value = t;
}

void setTempSystem(int t) {
  tempSystem.value = t;
}

void setFanSystem(int t) {
  fanSystem.value = t;
}

void setSensorErrHandle(int t) {
  sensorErrHandle.value = t;
}

void setVersion(String t){
  version.value=t;
}

void setExternalSensor(int t){
  externalSensor.value=t;
}
