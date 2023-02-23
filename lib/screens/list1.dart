import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import 'package:venuestar/screens/list2.dart';

class ListView1 extends StatefulWidget {
  const ListView1({final Key? key}) : super(key: key);

  @override
  State<ListView1> createState() => _ListView1State();
}

class _ListView1State extends State<ListView1> {
  @override
  Widget build(final BuildContext context) => Scaffold(
                backgroundColor: Colors.black,

      appBar: AppBar(
           backgroundColor: Colors.black,
        title: const Text("Sample ListView 1"),
        leading: const BackButton(
            key: Key("Back"), color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: ListView(
        key: const Key("ListView"),
        padding: const EdgeInsets.all(8),
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
           Card(
            color: const Color.fromARGB(38, 255, 255, 255),
              child: ListTile(
            title: const Text("Gift Shop", style: TextStyle(color: Colors.white),),
            subtitle: const Text("xxxxxx xxxxx xxxxxx",style: TextStyle(color: Colors.white),),
            leading: SvgPicture.asset(
 'assets/icons/gift.svg', width: 34,height: 34,color: Colors.white,),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
            onTap: () {
               PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
                  withNavBar: true,
                  settings: const RouteSettings(name: "/html"),
                  // ignore: prefer_const_constructors
                  screen:  ListView2());
            },
          )),
          Card(
            color: const Color.fromARGB(38, 255, 255, 255),
              child: ListTile(
            title: const Text("Gift Shop", style: TextStyle(color: Colors.white),),
            subtitle: const Text("xxxxxx xxxxx xxxxxx",style: TextStyle(color: Colors.white),),
            leading: SvgPicture.asset(
 'assets/icons/gift.svg', width: 34,height: 34,color: Colors.white,),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
            onTap: () {
               PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
                  withNavBar: true,
                  settings: const RouteSettings(name: "/html"),
                  // ignore: prefer_const_constructors
                  screen:  ListView2());
            },
          )),
          Card(
            color: const Color.fromARGB(38, 255, 255, 255),
              child: ListTile(
            title: const Text("Gift Shop", style: TextStyle(color: Colors.white),),
            subtitle: const Text("xxxxxx xxxxx xxxxxx",style: TextStyle(color: Colors.white),),
            leading: SvgPicture.asset(
 'assets/icons/gift.svg', width: 34,height: 34,color: Colors.white,),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
            onTap: () {
               PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
                  withNavBar: true,
                  settings: const RouteSettings(name: "/html"),
                  // ignore: prefer_const_constructors
                  screen:  ListView2());
            },
          )),
          Card(
            color: const Color.fromARGB(38, 255, 255, 255),
              child: ListTile(
            title: const Text("Gift Shop", style: TextStyle(color: Colors.white),),
            subtitle: const Text("xxxxxx xxxxx xxxxxx",style: TextStyle(color: Colors.white),),
            leading: SvgPicture.asset(
 'assets/icons/gift.svg', width: 34,height: 34,color: Colors.white,),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
            onTap: () {
               PersistentNavBarNavigator.pushNewScreenWithRouteSettings(context,
                  withNavBar: true,
                  settings: const RouteSettings(name: "/html"),
                  // ignore: prefer_const_constructors
                  screen:  ListView2());
            },
          )),
          
        ],
      ));
}
