import 'package:animated_mail_app/utils.dart';
import 'package:flutter/material.dart';

class EmailCard extends StatefulWidget {
  final bool isCurrentPage;
  EmailCardModel? email;
  final Color colorsButton;

  EmailCard({
    super.key, required this.isCurrentPage, this.email, required this.colorsButton,
  });

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard>
    with SingleTickerProviderStateMixin {
  

  @override
  Widget build(BuildContext context) {
    return widget.email == null ? Transform.scale(
      scale: 1.6,
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
              child: Text("Sem emails disponivel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),))),
    ) : Column(
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
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: widget.colorsButton,
                  ),
                  const Spacer(),
                  if (widget.isCurrentPage) ...[
                    const Spacer(),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: widget.colorsButton.withOpacity(.2),
                      child: IconButton(
                          onPressed: () {},
                          icon:  Icon(
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
                height: 40,
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
        widget.isCurrentPage
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
    );
  }
}

class EmailCardModel {

  String name;
  Color color;

  EmailCardModel({required this.name, required this.color});
}
