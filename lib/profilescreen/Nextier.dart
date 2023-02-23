import "package:flutter/material.dart";
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Nexttier extends StatelessWidget {
  var textvalue;

  Nexttier({super.key, required this.textvalue});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double _volumeValue = 27;
    int d = _volumeValue.toInt();
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TapToExpandNextier(
        content: SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                Container(
                  width: width / 1.6,
                  child: const Text(
                    "As of 08 Feb 2023 You are currently in the GOLD tier & you have earned 27 qualification points in the period. You need 2972 qualification points to maintain GOLD",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 2999,
                              startAngle: 270,
                              endAngle: 270,
                              showLabels: false,
                              showTicks: false,
                              radiusFactor: 0.8,
                              axisLineStyle: const AxisLineStyle(
                                  cornerStyle: CornerStyle.bothFlat,
                                  color: Colors.black12,
                                  thickness: 8),
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  angle: 90,
                                  axisValue: 5,
                                  positionFactor: 0.2,
                                  widget: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(d.toString(),
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFCC2B5E)))),
                                ),
                              ],
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: _volumeValue,
                                  cornerStyle: CornerStyle.bothFlat,
                                  width: 20,
                                  sizeUnit: GaugeSizeUnit.logicalPixel,
                                  color: const Color(0xFFAD1457),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Of 2999 Pts",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        title1: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                padding: const EdgeInsets.symmetric(vertical: 13),
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
        openedHeight: 190,
      ),
    );
  }
}

class TapToExpandNextier extends StatefulWidget {
  final Widget content;

  /// A parameter that is used to show the title of the widget.
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
        /* margin: EdgeInsets.symmetric(
          /// Used to set the padding of the widget when it is closed.
          horizontal: isExpanded ? 25 : widget.onTapPadding ?? 10,
          vertical: 10,
        ),*/

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
                // physics: widget.scrollPhysics,
                children: [
                  /// Creating a row with two widgets. The first widget is the title widget and the
                  /// second widget is the trailing widget. If the trailing widget is null, then it will
                  /// show an arrow icon.
                  !isExpanded
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
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
                                      "HOW FAR TO NEXT TIER?",
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

                  /// Used to add some space between the title and the content.
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
                  /// Creating a row with two widgets. The first widget is the title widget and the
                  /// second widget is the trailing widget. If the trailing widget is null, then it will
                  /// show an arrow icon.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.title1,
                    ],
                  ),

                  /// Used to add some space between the title and the content.
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
