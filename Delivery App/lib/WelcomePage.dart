import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'LoginPage.dart';

class WelcomePageWidget extends StatelessWidget {
  const WelcomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    // slides.add(
    //   Slide(
    //     title: "ERASER",
    //     description:
    //         "Allow miles wound place the leave had. To sitting subject no improve studied limited",
    //     pathImage: "images/photo_eraser.png",
    //     backgroundColor: const Color(0xfff5a623),
    //   ),
    // );
    // slides.add(
    //   Slide(
    //     title: "PENCIL",
    //     description:
    //         "Ye indulgence unreserved connection alteration appearance",
    //     pathImage: "images/photo_pencil.png",
    //     backgroundColor: const Color(0xff203152),
    //   ),
    // );
    // slides.add(
    //   Slide(
    //     title: "RULER",
    //     description:
    //         "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
    //     pathImage: "images/photo_ruler.png",
    //     backgroundColor: const Color(0xff9932CC),
    //   ),
    // );
    slides.add(
      Slide(
        backgroundImage: ("images/slide.png"),
        backgroundImageFit: BoxFit.fill,
        backgroundOpacity: 0,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPageWidget()),
    );
  }

  void onNextPress() {
    print("onNextPress caught");
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0x33FFA8B0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: IntroSlider(
        // List slides
        slides: slides,

        // Skip button
        renderSkipBtn: renderSkipBtn(),
        skipButtonStyle: myButtonStyle(),

        // Next button
        renderNextBtn: renderNextBtn(),
        onNextPress: onNextPress,
        nextButtonStyle: myButtonStyle(),

        // Done button
        renderDoneBtn: renderDoneBtn(),
        onDonePress: onDonePress,
        doneButtonStyle: myButtonStyle(),

        // Dot indicator
        colorDot: const Color(0x33FFA8B0),
        colorActiveDot: const Color(0xffFFA8B0),
        sizeDot: 13.0,

        // Show or hide status bar
        hideStatusBar: true,
        backgroundColorAllSlides: Colors.transparent,

        // Scrollbar
        verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
      ),
    );
  }
}
