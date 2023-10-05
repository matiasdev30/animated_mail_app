import 'package:animated_mail_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:animated_mail_app/page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationControllerText;
  late Animation moveTextAnimation;

  @override
  void initState() {
    animationControllerText =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..repeat();
    moveTextAnimation =
        Tween<double>(begin: 600, end: -615).animate(animationControllerText);

    super.initState();
  }

  @override
  void dispose() {
    animationControllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color:  Colors.grey,
          width: screenWidth(context),
          height: screenHeigth(context),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth(context),
                height: 300,
                child: AnimatedBuilder(
                  animation: animationControllerText,
                  child: Container(
                      child: Center(
                    child: /* Transform.translate(
                                offset: const Offset(540, 0),
                                child: */
                        Transform.scale(
                            alignment: Alignment.center,
                            scale: 20 ,
                            child: const Text(
                              "MVNI NULL",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "MyFont2"),
                            )),
                  )),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(moveTextAnimation.value, 80),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
          child: Positioned(
            child: Row(children: [
               const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.black,
                            child: FlutterLogo(),
                          ),
              const Spacer(),
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade600,
                child: IconButton(
                    onPressed: () {},
                    icon:  Icon(
                      Icons.chat,
                      color: Colors.grey[800],
                      size: 20,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              
               IconButton(
                    onPressed: () {},
                    icon:  Icon(
                      Icons.inbox,
                      color: Colors.grey[600],
                      size: 24,
                    )),
                     const SizedBox(
                width: 5,
              ),
               IconButton(
                    onPressed: () {},
                    icon:  Icon(
                      Icons.send_outlined,
                      color: Colors.grey[600],
                      size: 24,
                    )),
              const Spacer(),
               IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                      size: 30,

                    )),
            ]),
          ),
        ),
        EmailCard(
          opacity: 1,
          margin: 16,
        ),
      ],
    ));
  }

  mailCard(
      {double buttom = 10,
      double margin = 0,
      double rotate = 0,
      required double opacity}) {
    EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: margin / 2);

    return AnimatedPositioned(
      bottom: buttom,
      duration: const Duration(milliseconds: 400),
      child: GestureDetector(
        onHorizontalDragDown: (details) {
          print("play");
          setState(() {
            buttom = buttom - 8;
            print(buttom);
          });
        },
        child: Transform.rotate(
          angle: rotate,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: 1,
            child: Padding(
              padding: edgeInsets,
              child: Center(
                child: Container(
                  width: screenWidth(context) - margin,
                  height: screenHeigth(context) / 2.15,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(opacity),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  item({required IconData icon, required String text}) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              //animationController.reverse();
            },
            icon: Icon(
              icon,
              color: Colors.white,
              size: 20,
            )),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}
