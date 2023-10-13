import 'package:animated_mail_app/utils.dart';
import 'package:flutter/material.dart';

class EmailCard extends StatefulWidget {
  final bool isCurrentPage;
  EmailCardModel? email;
  final Color colorsButton;
  String? photo;

  final Widget displayWidget;

  EmailCard({
    super.key,
    required this.isCurrentPage,
    this.email,
    this.photo,
    required this.colorsButton,
    required this.displayWidget,
  });

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.email == null) {
      return Transform.scale(
        scale: 1.7,
        child: AnimatedContainer(
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
            child: const Center(
                child: Text(
              "Sem emails disponivel",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ))),
      );
    } else {
      return Column(
        children: [
          AnimatedContainer(
            height: 205,
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
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: widget.colorsButton,
                      backgroundImage: widget.photo != null
                          ? AssetImage(widget.photo!)
                          : null,
                    ),
                    const Spacer(),
                    if (widget.isCurrentPage) ...[
                      const Spacer(),
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: widget.colorsButton.withOpacity(.2),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chat,
                              color: widget.colorsButton,
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Row(
                    children: [
                      Text(
                        widget.email!.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Spacer(),
                      const Text(
                        "10:30",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
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
                ...[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                    ),
                    width: screenWidth(context),
                    height: 110,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          widget.displayWidget,
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white.withOpacity(.3),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.download,
                                    color: Colors.white,
                                    size: 13,
                                  )),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white.withOpacity(.3),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 13,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
              ]),
            ),
          ),
         Container(
                width: screenWidth(context),
                height: 38,
                padding: const EdgeInsets.only(left: 6, right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: widget.colorsButton.withOpacity(.2),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: widget.colorsButton,
                            size: 13,
                          )),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text("Reply", style: TextStyle(fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Positioned(
                          left: 1,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: widget.colorsButton.withOpacity(.2),
                            ),
                            child: const Center(
                              child: Text("💔", style: TextStyle(fontSize: 12)),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: widget.colorsButton.withOpacity(.2),
                            ),
                            child: const Center(
                              child: Text("😂", style: TextStyle(fontSize: 12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: widget.colorsButton.withOpacity(.2),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.done,
                            color: widget.colorsButton,
                            size: 13,
                          )),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text("Accept", style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              
          const SizedBox(
            height: 3,
          ),
          widget.isCurrentPage
              ? Container(
                  width: screenWidth(context),
                  height: 10,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      );
    }
  }
}

class EmailCardModel {
  String name;
  Color color;
  Widget? file;
  String? description;
  String? photo;

  EmailCardModel(
      {required this.name,
      required this.color,
      required this.file,
      required this.description,
      this.photo});
}
