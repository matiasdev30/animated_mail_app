import 'package:animated_mail_app/utils.dart';
import 'package:flutter/material.dart';

class EmailCard extends StatefulWidget {
  double buttom;
  double margin;
  double rotate;
  double opacity;

  EmailCard(
      {super.key,
      this.buttom = 90,
      this.margin = 0,
      this.rotate = 0,
      required this.opacity});

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  List<EmailCardModel> emailsCard = [
    EmailCardModel(buttom: 90),
    EmailCardModel(buttom: 50),
    EmailCardModel(buttom: 10),
    EmailCardModel(buttom: 50),
    EmailCardModel(buttom: 10),
    EmailCardModel(buttom: 50),
    EmailCardModel(buttom: 10)
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
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    pageController = PageController(viewportFraction: 0.35, initialPage: 2);
    pageController.addListener(_coffeScrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
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
            padding: const EdgeInsets.only(bottom: 0, left: 80, right: 80),
            child: Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..translate(
                    0.0,
                    index == _currentPage - 1
                        ? screenHeigth(context) / 8 * (.99 - value).abs()
                        : screenHeigth(context) / 9 * (.99 - value).abs())
                ..scale(value),
              child: Opacity(
                opacity: opacity,
                child: Container(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.only(
                          top: 4,
                          left: 4,
                          right: 4,
                        ),
                        margin: const EdgeInsets.only(bottom: 3, top: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              blurRadius: 1,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Column(children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 16,
                                ),
                                const Spacer(),
                                if (index == _currentPage + 1) ...[
                                  const Spacer(),
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.grey[200],
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.chat,
                                          color: Colors.grey,
                                          size: 13,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.yellow[50],
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 14,
                                        )),
                                  ),
                                ] else ...[
                                  const Text("11:00"),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ]
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 4, right: 4),
                              child: Row(
                                children: [
                                  Text(
                                    "Jackson Houston",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Spacer(),
                                  Text(
                                    "10:30",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 4, right: 4),
                              child: Row(
                                children: [
                                  Text(
                                    "The Number 1 Secret Of Sucess",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Text(
                                    "22.06.2022",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                                width: screenWidth(context),
                                height: 89,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200])),
                            const SizedBox(
                              height: 4,
                            ),
                          ]),
                        ),
                      ),
                      Container(
                          width: screenWidth(context),
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white)),
                      const SizedBox(
                        height: 3,
                      ),
                      index == _currentPage + 1
                          ? Container(
                              width: screenWidth(context),
                              height: 10,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Colors.white))
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class EmailCardModel {
  double buttom;

  EmailCardModel({required this.buttom});
}
