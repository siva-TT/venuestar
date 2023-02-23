import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeInCurve: Curves.easeInExpo,
      fadeOutCurve: Curves.easeOutExpo,
      placeholder: const AssetImage("assets/learningpage/splash_2.png"),
      image: const NetworkImage(
          "https://stageserverds.blob.core.windows.net/tsg/AppImages/LearningPages/1.png"),
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
            child: Image.asset("assets/learningpage/splash_2.png"));
      },
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeInCurve: Curves.easeInExpo,
      fadeOutCurve: Curves.easeOutExpo,
      placeholder: AssetImage("assets/learningpage/splash_2.png"),
      image: const NetworkImage(
        "https://stageserverds.blob.core.windows.net/tsg/AppImages/LearningPages/2.png",
      ),
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
            child: Image.asset("assets/learningpage/splash_2.png"));
      },
      fit: BoxFit.cover,
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeInCurve: Curves.easeInExpo,
      fadeOutCurve: Curves.easeOutExpo,
      placeholder: AssetImage("assets/learningpage/splash_2.png"),
      image: const NetworkImage(
        "https://stageserverds.blob.core.windows.net/tsg/AppImages/LearningPages/3.png",
      ),
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
            child: Image.asset("assets/learningpage/splash_2.png"));
      },
      fit: BoxFit.cover,
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fadeInDuration: const Duration(milliseconds: 500),
        fadeInCurve: Curves.easeInExpo,
        fadeOutCurve: Curves.easeOutExpo,
        placeholder: const AssetImage("assets/learningpage/splash_2.png"),
        image: NetworkImage(
          "https://stageserverds.blob.core.windows.net/tsg/AppImages/LearningPages/4.png",
        ),
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
              child: Image.asset("assets/learningpage/splash_2.png"));
        },
        fit: BoxFit.cover);
  }
}

class Item5 extends StatelessWidget {
  const Item5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeInCurve: Curves.easeInExpo,
      fadeOutCurve: Curves.easeOutExpo,
      placeholder: AssetImage("assets/learningpage/splash_2.png"),
      image: NetworkImage(
        "https://stageserverds.blob.core.windows.net/tsg/AppImages/LearningPages/5.png",
      ),
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
            child: Image.asset("assets/learningpage/splash_2.png"));
      },
      fit: BoxFit.cover,
    );
  }
}
