import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Prefrences extends StatefulWidget {
  const Prefrences({super.key});

  @override
  State<Prefrences> createState() => _PrefrencesState();
}

class _PrefrencesState extends State<Prefrences> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  var textValue = 'Switch is OFF';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 7,
      width: double.infinity,
      child: Card(
        color: Colors.amber,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        //margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 22,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.network_cell,
                              size: 25,
                              color: Colors.amber,
                            )),
                        SizedBox(
                          width: 6,
                        ),
                        Center(
                          child: Text(
                            "PREFRENCES",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Opt in for Marketting",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //Container(child:,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SMS",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                FlutterSwitch(
                  showOnOff: true,
                  height: 25,
                  activeToggleColor: Colors.amber,
                  inactiveToggleColor: Colors.amber,
                  activeTextColor: Colors.amber,
                  inactiveTextColor: Colors.amber,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  value: isSwitched,
                  onToggle: (val) {
                    setState(() {
                      isSwitched = val;
                    });
                  },
                ),
                const Text(
                  "EMAIL",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                FlutterSwitch(
                  showOnOff: true,
                  height: 25,
                  activeToggleColor: Colors.amber,
                  inactiveToggleColor: Colors.amber,
                  activeTextColor: Colors.amber,
                  inactiveTextColor: Colors.amber,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  value: isSwitched1,
                  onToggle: (val) {
                    setState(() {
                      isSwitched1 = val;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
