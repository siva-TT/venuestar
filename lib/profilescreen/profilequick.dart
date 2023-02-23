import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profilequick extends StatefulWidget {
  const Profilequick({super.key});

  @override
  State<Profilequick> createState() => _ProfilequickState();
}

class _ProfilequickState extends State<Profilequick> {
  List<dynamic> _quickdata = [];
  Future<void> readJson() async {
    var decoded = base64.decode(
        "eyJQYXRyb25JdGVtcyI6W3siVCI6IlZpc2l0IFVzIiwiUElVIjoiaHR0cDovL3J4ZGV2ZHMuYmxvYi5jb3JlLndpbmRvd3MubmV0L3ZlbnVlbWV0cm8vQXBwSW1hZ2VzL1JYTUVNQkVSL1Byb2ZpbGVRdWlja3ZpZXdzL1Zpc2l0VXMucG5nIiwiVSI6Imh0dHA6Ly93d3cucmVkZWVteC5jb20vIiwiQUQiOiJFWFRFUk5BTFVSTFMifSx7IlQiOiJHU0wgVHJhbnNmZXIiLCJQSVUiOiJodHRwOi8vcnhkZXZkcy5ibG9iLmNvcmUud2luZG93cy5uZXQvdmVudWVtZXRyby9BcHBJbWFnZXMvUlhNRU1CRVIvUHJvZmlsZVF1aWNrdmlld3MvR1NMLnBuZyIsIkFEIjoiR1NMIn0seyJUIjoiSm9pbiIsIlBJVSI6Imh0dHA6Ly9yeGRldmRzLmJsb2IuY29yZS53aW5kb3dzLm5ldC92ZW51ZW1ldHJvL0FwcEltYWdlcy9SWE1FTUJFUi9Qcm9maWxlUXVpY2t2aWV3cy9HU0wucG5nIiwiQUQiOiJKT0lOIn0seyJUIjoiU3ViIENsdWJzIiwiUElVIjoiaHR0cDovL3J4ZGV2ZHMuYmxvYi5jb3JlLndpbmRvd3MubmV0L3ZlbnVlbWV0cm8vQXBwSW1hZ2VzL1JYTUVNQkVSL1Byb2ZpbGVRdWlja3ZpZXdzL1N1YmNsdWJzLnBuZyIsIkFEIjoiU1VCQ0xVQlMifSx7IlQiOiJUaWVyIEluZm8iLCJQSVUiOiJodHRwOi8vcnhkZXZkcy5ibG9iLmNvcmUud2luZG93cy5uZXQvdmVudWVtZXRyby9BcHBJbWFnZXMvUlhNRU1CRVIvUHJvZmlsZVF1aWNrdmlld3MvVGllckluZm8ucG5nIiwiQUQiOiJUSUVSSU5GTyJ9LHsiVCI6IkNoYW5nZSBQaW4iLCJQSVUiOiIiLCJBRCI6IlBJTkNIQU5HRSJ9LHsiVCI6IkluYm94IiwiUElVIjoiIiwiQUQiOiJOSUlOQk9YIn0seyJUIjoiTGFuZ3VhZ2UgUHJlZmVyZW5jZSIsIlBJVSI6IiIsIkFEIjoiTEFOR1VBR0VQUkVGIn0seyJUIjoiTWFya2V0aW5nIFByZWZlcmVuY2UiLCJQSVUiOiIiLCJBRCI6Ik1BUktFVElOR1BSRUYifSx7IlQiOiJTZW5kIEFwcCBMaW5rIiwiUElVIjoiaHR0cDovL3J4ZGV2ZHMuYmxvYi5jb3JlLndpbmRvd3MubmV0L3ZlbnVlbWV0cm8vQXBwSW1hZ2VzL1JYTUVNQkVSL1Byb2ZpbGVRdWlja3ZpZXdzL1NlbmRBcHBMaW5rLnBuZyIsIkFEIjoiU0VOREFQUExJTksifV19");

    final String response = await utf8.decode(decoded);
    final data = await json.decode(response);
    print(data["PatronItems"].length);
    setState(() {
      _quickdata = data["PatronItems"];
    });

    print(_quickdata);
  }

  void initState() {
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: _quickdata.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: height / 16,
            child: Card(
              color: Colors.amber,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: FadeInImage(
                        height: 50,
                        width: 50,
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeInCurve: Curves.easeInExpo,
                        fadeOutCurve: Curves.easeOutExpo,
                        placeholder: AssetImage("assets/GSL.png"),
                        image: NetworkImage(_quickdata[index]["PIU"]),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Container(
                            child: Image.asset(
                              "assets/GSL.png",
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        _quickdata[index]["T"],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontFamily: 'HelveticaNeue',
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
