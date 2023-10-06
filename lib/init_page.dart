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
  bool expanded = false;

  late AnimationController animationController;

  List<EmailCardModel> emailsCard = [
    EmailCardModel(name: "Olavio Pimpadas", color: const Color(0xff655D4C)),
    EmailCardModel(name: "Mvni Null", color: const Color(0xff0D6644)),
    EmailCardModel(name: "Smith Bambino", color: const Color(0xff8F9493)),
    EmailCardModel(name: "Lismar Lima", color: const Color(0xffDD2EFF)),
    EmailCardModel(name: "Giazi Monteiro", color: const Color(0xff316DD8)),
    EmailCardModel(name: "Rubem Sousa PO", color: const Color(0xffFEAF13)),
    EmailCardModel(name: "Cleuver Suares", color: const Color(0xff55EAFF)),
  ];

  late PageController pageController;

  double _currentPage = 0.0;

  bool expand = false;

  void _coffeScrollListener() {
    setState(() {
      _currentPage = pageController.page!;
    });
  }

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.35, initialPage: 2);
    pageController.addListener(_coffeScrollListener);

    animationControllerText =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..repeat();
    moveTextAnimation =
        Tween<double>(begin: 1040, end: -1040).animate(animationControllerText);

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
          color: _currentPage == emailsCard.length
              ? emailsCard.last.color
              : emailsCard[_currentPage.toInt()].color,
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
                            scale: 20,
                            child: _currentPage == emailsCard.length
                                ? const SizedBox.shrink()
                                : Text(
                                    emailsCard[_currentPage.toInt()]
                                        .name
                                        .toUpperCase(),
                                    style: const TextStyle(
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
                backgroundColor: Colors.black.withOpacity(0.2),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat,
                      color: Colors.black,
                      size: 20,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.inbox,
                    color: Colors.black,
                    size: 24,
                  )),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_outlined,
                    color: Colors.black,
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
        AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: expanded ? 0 : 1,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    expanded = true;
                  });
                },
                child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    controller: pageController,
                    itemCount: emailsCard.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const SizedBox.shrink();
                      }
                      final result = _currentPage - index + 1;
                      final value = -.42 * result + 1;
                      final opacity = value.clamp(0.0, 1.0);

                      print(result);

                      return Transform.scale(
                          alignment: Alignment.bottomCenter,
                          scale: 1.6,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 0, left: 80, right: 80),
                            child: Transform(
                              alignment: Alignment.bottomCenter,
                              transform: Matrix4.identity()
                                ..translate(
                                    0.0,
                                    index == _currentPage - 1
                                        ? screenHeigth(context) /
                                            8 *
                                            (.99 - value).abs()
                                        : screenHeigth(context) /
                                            9 *
                                            (.99 - value).abs())
                                ..scale(value),
                              child: Opacity(
                                  opacity: _currentPage == emailsCard.length
                                        ? 1 : opacity,
                                  child: EmailCard(
                                    colorsButton: _currentPage == emailsCard.length
                                        ? emailsCard.last.color
                                        : emailsCard[_currentPage.toInt()].color,
                                    isCurrentPage: index == _currentPage + 1,
                                    email: _currentPage == emailsCard.length
                                        ? null
                                        : emailsCard[_currentPage.toInt()],
                                  )),
                            ),
                          ));
                    }))),
        IgnorePointer(
          ignoring: !expanded,
          child: GestureDetector(
            onHorizontalDragDown: (value) {
              setState(() {
                if (value.localPosition.dy < 140) {
                  expanded = false;
                }
              });
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: !expanded ? 0 : 1,
              child: Align(
                alignment: const Alignment(0, .6),
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32)),
                  alignment: Alignment.bottomCenter,
                  height: expanded ? screenHeigth(context) : 330,
                  duration: const Duration(milliseconds: 400),
                  margin: const EdgeInsets.only(
                      top: 80, left: 10, bottom: 10, right: 10),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
