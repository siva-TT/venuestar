import "package:flutter/material.dart";
import 'package:venuestar/custom-widget-tabs.widget.dart';
import 'package:venuestar/model.dart';
import 'package:venuestar/profilescreen/Nextier.dart';
import 'package:venuestar/profilescreen/constants.dart';
import 'package:venuestar/profilescreen/pointvalidity.dart';
import 'package:venuestar/profilescreen/profilequick.dart';
import 'profilescreen/Prefrences.dart';
import 'profilescreen/Profilecards.dart';
import 'profilescreen/membership.dart';
import 'profilescreen/wallet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {final Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileItems item = ProfileItems();
  @override
  void initState() {
    super.initState();

    item.ProfileHeader = "MY PROFILE";
    // _data = fetch();
  }

  @override
  Widget build(final BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Center(
                            child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          item.ProfileHeader.toString(),
                          style: const TextStyle(
                            fontFamily: 'HelveticaNeue',
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: width / 3.5,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Align(
                                  alignment: Alignment.topCenter,
                                  child: Icon(
                                    Icons.exit_to_app,
                                    size: 18,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomWidgetExample(
                                        menuScreenContext: context,
                                      ),
                                    ),
                                  );
                                  //  Navigator.pop(context);
                                },
                                child: const Text(
                                  Constants.logout,
                                  style: TextStyle(
                                    fontFamily: 'HelveticaNeue',
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Membership(),
              ProfileCards(textvalue: "SHOW MY WALLET BALANCE"),
              Nexttier(textvalue: "HOW FAR TO NEXT TIER?"),
              Pointvalidity(textvalue: "VIEW MY POINTS VALIDITY"),
              const Prefrences(),
              const SizedBox(
                height: 6,
              ),
              const Profilequick(),
            ],
          ),
        ),
      ),
    );
  }
}
