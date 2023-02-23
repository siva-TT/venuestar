import 'dart:convert';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_list/grouped_list.dart';

class Pointvalidity extends StatefulWidget {
  var textvalue;

  Pointvalidity({super.key, required this.textvalue});

  @override
  State<Pointvalidity> createState() => _PointvalidityState();
}

class _PointvalidityState extends State<Pointvalidity> {
  List _Pointdata = [];
  List _title = [];
  List<dynamic> PtsType = [];
  List<dynamic> data = [];

// Fetch content from the json file
  Future<void> loadData() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);

    setState(() {
      _Pointdata = data["PointsData"];
      _title = data["Title"];
    });
  }

  @override
  void initState() {
    loadData(); //.then((value) => catalogdata=value);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    String textvalue = widget.textvalue;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: TapToExpandNextier(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              //Text(_Pointdata.toString()),
              //_items.isNotEmpty
              Container(
                height: 50,
                width: width,
                child: Card(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _title.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _title[index],
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: width / 8)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: height / 2.5,
                child: GroupedListView<dynamic, String>(
                  physics: NeverScrollableScrollPhysics(),
                  elements: _Pointdata,
                  groupBy: (element) => element['PtsType'],
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1['Earned'].compareTo(item2['Earned']),
                  order: GroupedListOrder.DESC,
                  // useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => SizedBox(
                    height: 50,
                    width: width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value /* ["PtsType"] */ .toString(),
                              // _Pointdata[index]["PtsType"],
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemBuilder: (c, element) {
                    return Expanded(
                      child: SizedBox(
                        width: width,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      element["Earned"],
                                      style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      element["Points"],
                                      style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      element["ValidUntil"],
                                      style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
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
        openedHeight: height / 1.8,
      ),
    );
  }
}

class TapToExpandNextier extends StatefulWidget {
  final Widget content;

  final Widget title1;

  /// A parameter that is used to show the trailing widget.
  final Widget? trailing;

  /// A parameter that is used to set the color of the widget.
  final Color? color;

  /// Used to set the color of the shadow.
  final List<BoxShadow>? boxShadow;

  /// Used to make the widget scrollable.
  final bool? scrollable;

  /// Used to set the height of the widget when it is closed.
  final double? closedHeight;

  /// Used to set the height of the widget when it is opened.
  final double? openedHeight;

  /// Used to set the duration of the animation.
  final Duration? duration;

  /// Used to set the padding of the widget when it is closed.
  final double? onTapPadding;

  /// Used to set the border radius of the widget.
  final double? borderRadius;

  /// Used to set the physics of the scrollable widget.
  final ScrollPhysics? scrollPhysics;

  /// A constructor.
  const TapToExpandNextier({
    Key? key,
    required this.content,
    required this.title1,
    this.color,
    this.scrollable,
    this.closedHeight,
    this.openedHeight,
    this.boxShadow,
    this.duration,
    this.onTapPadding,
    this.borderRadius,
    this.scrollPhysics,
    this.trailing,
  }) : super(key: key);
  @override
  State<TapToExpandNextier> createState() => _TapToExpandNextierState();
}

class _TapToExpandNextierState extends State<TapToExpandNextier> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    bool scrollable = widget.scrollable ?? false;

    /// Used to make the widget clickable.
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        /// Changing the state of the widget.
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        height:

            /// Used to set the height of the widget when it is closed and opened depends on the isExpanded parameter.
            isExpanded ? widget.closedHeight ?? 70 : widget.openedHeight ?? 240,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: widget.duration ?? const Duration(milliseconds: 1200),
        decoration: BoxDecoration(
          /// Used to set the default value of the boxShadow parameter.

          color: widget.color ?? Colors.amber,
          borderRadius: BorderRadius.all(
            Radius.circular(isExpanded ? widget.borderRadius ?? 20 : 20),
          ),
        ),
        child: scrollable
            ? ListView(
                children: [
                  !isExpanded
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 18,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  topLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Icon(
                                          Icons.money,
                                          size: 25,
                                          color: Colors.amber,
                                        )),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "POINTS EXPIRY",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.title1,
                          ],
                        ),

                
                  isExpanded ? const SizedBox() : const SizedBox(height: 20),

                  /// Used to show the content of the widget.
                  AnimatedCrossFade(
                    firstChild: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),

                    /// Showing the content of the widget.
                    secondChild: widget.content,
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration:
                        widget.duration ?? const Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.title1,
                    ],
                  ),

                  isExpanded ? const SizedBox() : const SizedBox(height: 20),

                  /// Used to show the content of the widget.
                  AnimatedCrossFade(
                    firstChild: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: widget.content,
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,

                    /// Used to set the duration of the animation.
                    duration:
                        widget.duration ?? const Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,

                    /// Used to set the curve of the animation.
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
      ),
    );
  }
}
