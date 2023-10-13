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
  bool showContext = false;

  late AnimationController animationController;

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
    List<EmailCardModel> emailsCard = [
      EmailCardModel(
        name: "Olavio Pimpadas",
        color: const Color(0xff655D4C),
        photo: "assets/img/olavio.jpg",
        file: const Wrap(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "The 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub\n\nBugatti says the \$5 milion Mistral will \"become the best a word\"\nThe 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        description: "Title: The 2024 Bugatti Mistral",
      ),
      EmailCardModel(
          name: "Mvni Null",
          photo: "assets/img/mani.jpg",
          color: const Color(0xff0D6644),
          file: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              /* image: const DecorationImage(
                    image: AssetImage("assets/gif/giphy_2.gif"),
                    fit: BoxFit.cover) */
            ),
            height: 110,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage("assets/gif/giphy_3.gif"),
                            fit: BoxFit.cover)),
                    height: 110,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage("assets/gif/giphy_0.gif"),
                            fit: BoxFit.cover)),
                    height: 110,
                  ),
                ),
              ],
            ),
          ),
          description:
              "The 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub\n\nBugatti says the \$5 milion Mistral will..."),
      EmailCardModel(
          photo: "assets/img/smith.jpg",
          name: "Smith Bambino",
          color: const Color(0xff8F9493),
          file: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage("assets/gif/giphy_2.gif"),
                    fit: BoxFit.cover)),
            height: 110,
          ),
          description:
              "The 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub\n\nBugatti says the \$5 milion Mistral will..."),
      EmailCardModel(
          photo: "assets/img/lima.jpg",
          name: "Lismar Lima",
          color: const Color(0xffDD2EFF),
          file: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage("assets/gif/giphy_0.gif"),
                    fit: BoxFit.cover)),
            height: 110,
          ),
          description:
              "The 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub\n\nBugatti says the \$5 milion Mistral will..."),
      EmailCardModel(
          photo: "assets/img/giazi.jpg",
          name: "Giazi Monteiro",
          color: const Color(0xff316DD8),
          file: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage("assets/gif/giphy_1.gif"),
                    fit: BoxFit.cover)),
            height: 110,
          ),
          description:
              "The 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub\n\nBugatti says the \$5 milion Mistral will..."),
      EmailCardModel(
          photo: "assets/img/rubem.jpg",
          name: "Rubem Sousa PO",
          color: const Color(0xffFEAF13),
          file: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              /* image: const DecorationImage(
                    image: AssetImage("assets/gif/giphy_2.gif"),
                    fit: BoxFit.cover) */
            ),
            height: 110,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(2),
                  width: screenWidth(context) / 3.64,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("assets/gif/giphy_1.gif"),
                          fit: BoxFit.cover)),
                  height: 110,
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  width: screenWidth(context) / 3.64,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage("assets/gif/giphy_0.gif"),
                          fit: BoxFit.cover)),
                  height: 110,
                ),
              ],
            ),
          ),
          description:
              "The 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub\n\nBugatti says the \$5 milion Mistral will..."),
      EmailCardModel(
          photo: "assets/img/cleuver.jpg",
          name: "Cleuver Suares",
          color: const Color(0xff55EAFF),
          file: Container(
            width: screenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage("assets/gif/giphy_3.gif"),
                    fit: BoxFit.cover)),
            height: 110,
          ),
          description:
              "The 2024 Bugatti Mistral roadster is more than a roofless Chiron, a we learned from Bugatti designer Jascha Straub\n\nBugatti says the \$5 milion Mistral will..."),
    ];

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
                                  ? 1
                                  : opacity,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_currentPage != emailsCard.length) {
                                      expanded = true;
                                    }
                                  });
                                },
                                child: EmailCard(
                                  photo: _currentPage == emailsCard.length
                                      ? null
                                      : emailsCard[index - 1].photo,
                                  displayWidget:
                                      _currentPage == emailsCard.length
                                          ? const SizedBox.shrink()
                                          : Wrap(
                                              children: [
                                                emailsCard[_currentPage.toInt()]
                                                    .file!
                                              ],
                                            ),
                                  colorsButton: _currentPage ==
                                          emailsCard.length
                                      ? emailsCard.last.color
                                      : emailsCard[_currentPage.toInt()].color,
                                  isCurrentPage: index == _currentPage + 1,
                                  email: _currentPage == emailsCard.length
                                      ? null
                                      : emailsCard[_currentPage.toInt()],
                                ),
                              )),
                        ),
                      ));
                })),
        IgnorePointer(
          ignoring: !expanded,
          child: GestureDetector(
            onHorizontalDragDown: (value) {
              setState(() {
                if (value.localPosition.dy < 140) {
                  if (_currentPage != emailsCard.length) {
                    expanded = false;
                    showContext = false;
                  }
                }
              });
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: !expanded ? 0 : 1,
              child: Align(
                alignment: const Alignment(0, .6),
                child: AnimatedContainer(
                  onEnd: () {
                    Future.delayed(
                      const Duration(milliseconds: 800),
                      () {
                        setState(() {
                          if (expanded) {
                            showContext = true;
                          } else {
                            showContext = false;
                          }
                        });
                      },
                    );
                  },
                  padding: const EdgeInsets.only(
                      left: 4, right: 4, bottom: 4, top: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32)),
                  alignment: Alignment.bottomCenter,
                  height: expanded ? screenHeigth(context) : 330,
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(
                      top: 80, left: 10, bottom: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 27,
                              backgroundColor: _currentPage == emailsCard.length
                                  ? Colors.grey
                                  : emailsCard[_currentPage.toInt()].color,
                              backgroundImage: _currentPage == emailsCard.length
                                  ? AssetImage(emailsCard[1].photo!)
                                  : AssetImage(
                                      emailsCard[_currentPage.toInt()].photo!),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _currentPage == emailsCard.length
                                      ? "Sem emails disponivel"
                                      : emailsCard[_currentPage.toInt()].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const Text(
                                  "22.06.2022",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Spacer(),
                            CircleAvatar(
                              radius: 27,
                              backgroundColor: _currentPage == emailsCard.length
                                  ? Colors.grey
                                  : emailsCard[_currentPage.toInt()]
                                      .color
                                      .withOpacity(.2),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chat,
                                    color: _currentPage == emailsCard.length
                                        ? Colors.grey
                                        : emailsCard[_currentPage.toInt()]
                                            .color,
                                    size: 20,
                                  )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 27,
                              backgroundColor: Colors.yellow[50],
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 26,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        height: expanded ? 620 : 330,
                        duration: expanded
                            ? const Duration(milliseconds: 840)
                            : const Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                            color: Colors.grey[200]),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 0, bottom: 10),
                            child: _currentPage == emailsCard.length
                                ? const SizedBox.shrink()
                                : showContext == true
                                    ? SingleChildScrollView(
                                        padding: const EdgeInsets.only(
                                            top: 30, left: 5, right: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                                emailsCard[_currentPage.toInt()]
                                                    .description!,
                                                style: const TextStyle(
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.fade),
                                                textAlign: TextAlign.left),
                                            Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: emailsCard[
                                                          _currentPage.toInt()]
                                                      .file!,
                                                ),
                                                Positioned(
                                                  bottom: 10,
                                                  right: 10,
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundColor: Colors
                                                        .white
                                                        .withOpacity(.3),
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.download,
                                                          color: Colors.white,
                                                          size: 20,
                                                        )),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundColor: Colors
                                                        .white
                                                        .withOpacity(.3),
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.play_arrow,
                                                          color: Colors.white,
                                                          size: 20,
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : CircularProgressIndicator(
                                        color: _currentPage == emailsCard.length
                                            ? emailsCard.last.color
                                            : emailsCard[_currentPage.toInt()]
                                                .color,
                                      ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
