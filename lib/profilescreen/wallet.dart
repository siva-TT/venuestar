import 'dart:convert';

import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  List<dynamic> _quickdata = [];

  Future<void> readJson() async {
    var decoded = base64.decode(
        "W3siSUQiOiIxIiwiQ2FwIjoiTXkgUmV3YXJkcyIsIkJhbCI6IjgxMTg3In0seyJJRCI6IjMiLCJDYXAiOiIiLCJCYWwiOiIzMDM4In0seyJJRCI6IjE2IiwiQ2FwIjoiIiwiQmFsIjoiODQ1OSJ9LHsiSUQiOiIxNyIsIkNhcCI6IkJsdWUgVm91Y2hlciIsIkJhbCI6IjE1Njk4In0seyJJRCI6IjE4IiwiQ2FwIjoiT3JhbmdlIFZvdWNoZXIiLCJCYWwiOiIyNzUzIn1d");

    final String response = await utf8.decode(decoded);
    final data = await json.decode(response);
    print(data.length);
    setState(() {
      _quickdata = data;
    });

    print(_quickdata);
  }

  void initState() {
    readJson();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    int? _selectedColorIndex;
    return Container(
      height: 100,
      width: 600,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: _quickdata.length,
        itemBuilder: (context, index) {
          _onSelected(int index) {
            setState(() => _selectedIndex = index);
          }

          return Container(
            // height: height / 10,
            width: width / 2.8,
            child: Card(
              color: Colors.white,
              //semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: FadeInImage(
                            height: 20,
                            width: 20,
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeInCurve: Curves.easeInExpo,
                            fadeOutCurve: Curves.easeOutExpo,
                            placeholder: AssetImage("assets/images/icon.png"),
                            image: NetworkImage(
                                "http://rxdevds.blob.core.windows.net/venuemetro/AppImages/RXMEMBER/ProfileQuickviews/GSL.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Container(
                                  child: Image.asset("assets/images/icon.png"));
                            },
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            _quickdata[index]["Cap"],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontSize: 12.0,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            _quickdata[index]["Bal"],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'HelveticaNeue',
                              fontSize: 19.0,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
