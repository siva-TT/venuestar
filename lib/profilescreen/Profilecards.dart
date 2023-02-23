import "package:flutter/material.dart";
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuestar/profilescreen/wallet.dart';
import 'package:venuestar/tapexpand.dart';

class ProfileCards extends StatelessWidget {
  String textvalue;

  ProfileCards({super.key, required this.textvalue});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(7),
      child: TapToExpand(
        content: /*const Center(
          child: Text(
            "2702",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),*/
            Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Wallet(),
        ),
        title1: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                width: 14,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: Text(
                  textvalue,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTapPadding: 10,
        closedHeight: 45,
        scrollable: true,
        borderRadius: 10,
        openedHeight: height / 4.5,
      ),
    );
  }
}
