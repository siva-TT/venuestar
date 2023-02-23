import 'package:flutter/material.dart';
import 'package:venuestar/model.dart';
import 'package:venuestar/profilescreen/Editprofile.dart';
import 'package:venuestar/profilescreen/constants.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  ProfileItems item = ProfileItems();
  @override
  void initState() {
    super.initState();

    item.Membershipheader = "MEMBERSHIP";
    item.membershiprenew = "RENEW";
    item.Membershipname = "DEIVANAI";
    item.membervalid = "23 AUG 2023";
    item.memberid = 999144;
    item.Membertier = "DOUBLEDIAMOND";
    item.phno = 0123456789;
    item.mailid = "deivanai@touchtier.com";
    // _data = fetch();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 3.2,
      child: Card(
        color: Colors.amber,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height / 21,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.person,
                                size: 25,
                                color: Colors.amber,
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          Center(
                            child: Text(
                              item.Membershipheader.toString(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox();
                                  },
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                radius: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 35,
                                  child: Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          height: height / 27,
                          width: width / 6.2,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                            //   topLeft: Radius.circular(40.0),
                            // bottomLeft: Radius.circular(40.0),
                          ),
                          child: Center(
                            child: Text(
                              item.membershiprenew.toString(),
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                                fontSize: 13.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Submember(
                nametitle: "NAME",
                name: item.Membershipname.toString(),
                icondata: Icons.person,
                nametitle1: "VALID TO",
                name1: item.membervalid.toString(),
                icondata1: Icons.star,
              ),
              const SizedBox(height: 10),
              Submember(
                nametitle: "MEMBER",
                name: item.memberid.toString(),
                icondata: Icons.star,
                nametitle1: "YOU ARE IN",
                name1: item.Membertier.toString(),
                icondata1: Icons.star,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: height / 18,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.mail,
                              size: 35,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "EMAIL",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              item.mailid.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'HelveticaNeue',
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: height / 18,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.phone,
                              size: 35,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "MOBILE NUMBER",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              item.phno.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'HelveticaNeue',
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Submember extends StatelessWidget {
  var name;
  final IconData icondata;

  var nametitle;

  var nametitle1;

  var name1;

  Submember(
      {super.key,
      @required this.name,
      @required this.nametitle,
      required this.icondata,
      @required this.nametitle1,
      @required this.name1,
      required IconData icondata1});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: height / 18,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        icondata,
                        size: 35,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nametitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        name,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.star,
                        size: 35,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nametitle1,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        name1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
